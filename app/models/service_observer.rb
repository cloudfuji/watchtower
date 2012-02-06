class ServiceObserver < ActiveRecord::Observer
  observe :service
  def after_update(model)
    if model.status_changed?
    
      if (model.status == 500 or model.status == 404) and model.status_was == 200
        Bushido::Event.publish({
                                 :category => :watchtower,
                                 :name => :critical,
                                 :data => model.to_json
                               })
      end

      if model.status == 200 and (model.status_was == 500 or model.status_was == 404)
                Bushido::Event.publish({
                                 :category => :watchtower,
                                 :name => :recovery,
                                 :data => model.to_json
                               })
      end

    end
  end
end
