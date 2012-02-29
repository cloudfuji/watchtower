class ServiceObserver < ActiveRecord::Observer
  observe :service

  def service_recovered(service)
    puts "Publishing service_downed event for #{service.service_url}"

    data = service.to_hash
    data[:human] = "#{service.service_url} has gone critical!"

    event = {
      :category => :service,
      :name     => :downed,
      :data     => data
    }

    puts "Publishing: #{event.inspect}"
    puts "Publishing to: #{Bushido::Event.events_url}"
    Bushido::Event.publish(event)
  end

  def service_downed(service)
    puts "Publishing service_recovered event for #{service.service_url}"

    data = service.to_hash
    data[:human] = "#{service.service_url} has recovered."

    event = {
      :category => :service,
      :name     => :recovered,
      :data     => data
    }

    puts "Publishing: #{event.inspect}"
    puts "Publishing to: #{Bushido::Event.events_url}"
    Bushido::Event.publish(event)
  end
end

