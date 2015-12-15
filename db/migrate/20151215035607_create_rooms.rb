class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :hex_color

      t.timestamps null: false
    end
  end
end
