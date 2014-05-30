class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.string :location
      t.string :name
      t.string :location
      t.string :img_url

      t.timestamps
    end
  end
end
