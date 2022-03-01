class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.text :room_introduction
      t.integer :price
      t.string :address
      t.string :room_image

      t.timestamps
    end
  end
end
