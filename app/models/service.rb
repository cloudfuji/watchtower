class Service < ActiveRecord::Base

  def ping
    puts "pinging service"
    puts self.service_url
    begin
      uri = URI(self.service_url)
      response = Net::HTTP.get_response(uri)
      puts "status"
      puts response.code
      self.status = response.code
    rescue Exception => ex
      puts "Ping Exception"
      puts ex
      self.status = 500
    end
    self.pinged_at = Time.now
    self.save
  end


end
