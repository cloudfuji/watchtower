class Service < ActiveRecord::Base

  def ping
    puts "pinging service"
    puts self.service_url

    current_status = self.status

    begin
      uri = URI(self.service_url)
      response = Net::HTTP.get_response(uri)
      puts "status: #{response.code}"
      self.status = new_status = response.code 
    rescue Exception => ex
      puts "Ping Exception"
      puts ex
      self.status = 500
    end

    self.pinged_at = Time.now
    self.save

    # There's been a status transition
    if new_status != current_status
      notify_observers(:service_recovered) if status == 200
      notify_observers(:service_downed)    if status != 200
    end
  end
end
