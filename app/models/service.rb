class Service < ActiveRecord::Base

  class << self
    def stable_status?(status)
      ["2", "3"].include?(status.first)
    end
  end

  def ping
    puts "pinging service"
    puts self.service_url

    current_status = self.status

    begin
      uri = URI(self.service_url)
      response = Net::HTTP.get_response(uri)
      puts "status: #{response.code}"
      self.status = new_status = response.code
    rescue => e
      puts "Ping Exception"
      puts e.inspect
      self.status = new_status = "500"
    end

    puts "Service: #{self.inspect}"

    self.pinged_at = Time.now
    self.save

    # There's been a status transition
    if new_status != current_status
      notify_observers(:service_recovered) if  Service.stable_status?( new_status )
      notify_observers(:service_downed)    if !Service.stable_status?( new_status )
    end
  end
end
