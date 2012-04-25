class ServiceObserver < ActiveRecord::Observer
  observe :service

  def service_recovered(service)
    puts "Publishing service_recovered event for #{service.service_url}"

    data = service.as_json
    data[:human] = "#{service.service_url} has recovered!"

    Cloudfuji::Event.publish(:category => :service,
                           :name     => :recovered,
                           :data     => data)
  end

  def service_downed(service)
    puts "Publishing service_downed event for #{service.service_url}"

    data = service.as_json
    data[:human] = "#{service.service_url} has gone critical!"

    Cloudfuji::Event.publish(:category => :service,
                           :name     => :downed,
                           :data     => data)
  end
end
