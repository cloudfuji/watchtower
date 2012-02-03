puts "launching thread loop"
main_thread = Thread.new {
  while true
    Service.all.each do |s|
      if s.pinged_at.nil? or Time.now.utc >= s.pinged_at + s.interval.minutes 
        thread = Thread.new(s) do
          s.ping
        end
      end
    end
    sleep 10
  end
}
 
