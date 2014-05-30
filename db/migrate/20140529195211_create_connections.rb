class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.string :location
      t.string :industry
      t.string :name
      t.string :img_url
      t.string :blurb
      t.string :connection_id
      t.integer :user_id

      t.timestamps
    end
  end
end
