puts "launching thread loop"
main_thread = Thread.new {
  while true
    puts "checking services"
    Service.all.each do |s|
      puts "checking state of"
      puts s.service_url
      puts s.pinged_at.inspect
      #puts s.pinged_at + s.interval.minutes >= Time.now
      if s.pinged_at.nil? or Time.now.utc >= s.pinged_at + s.interval.minutes 
        thread = Thread.new(s) do
          puts "pinging"
          puts s.service_url
          s.ping
        end
        #thread.join
      end
    end
    sleep 10
  end
}
 
