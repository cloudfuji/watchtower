class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :service_url
      t.string :service_type
      t.integer :interval
      t.string :status

      t.timestamps
    end
  end
end
