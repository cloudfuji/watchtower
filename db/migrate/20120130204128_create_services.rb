class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :service_url
      t.string :service_type
      t.integer :interval, :default => 1
      t.string :status
      t.timestamp :pinged_at

      t.timestamps
    end
  end
end
