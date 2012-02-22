class ServiceObserver < ActiveRecord::Observer
  observe :service
  def after_update(model)
    if model.status_changed?
    
      if (model.status == 500 or model.status == 404) and model.status_was == 200
        data = model.to_hash
        data[:human] = "#{model.service_url} has gone critical!"
        Bushido::Event.publish({
                                 :category => :site_monitor,
                                 :name => :critical,
                                 :data => data
                               })
      end

      if model.status == 200 and (model.status_was == 500 or model.status_was == 404)
        data = model.to_hash
        data[:human] = "#{model.service_url} has recovered."

        Bushido::Event.publish({
                                 :category => :site_monitor,
                                 :name => :recovered,
                                 :data => data
                               })
      end

    end
  end
end
