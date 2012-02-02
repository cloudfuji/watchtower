puts "launching thread loop"
main_thread = Thread.new {
  while true
    puts "checking services"
    Service.all.each do |s|
      puts s.service_url
      if s.pinged_at.nil? or s.pinged_at + s.interval.minutes >= Time.now
        thread = Thread.new(s) do
          s.ping
        end
        #thread.join
      end
    end
    sleep 10
  end
}
 
