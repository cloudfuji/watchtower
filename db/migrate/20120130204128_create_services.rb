class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :url
      t.string :type
      t.integer :interval
      t.string :status

      t.timestamps
    end
  end
end
