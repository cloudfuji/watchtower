class Service < ActiveRecord::Base

  def ping
    puts "pinging service"
    begin
      uri = URI(self.service_url)
      response = Net::HTTP.get_response(uri)
      self.status = response.code
    rescue Exception => ex
      self.status = 500
    end
    self.pinged_at = Time.now
    save
  end

end
