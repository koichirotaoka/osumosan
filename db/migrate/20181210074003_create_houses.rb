class CreateHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.text :title
      t.integer :rent
      t.integer :deposit
      t.integer :gratuityfee
      t.text :location
      t.text :access
      t.integer :area
      t.integer :age
      t.text :layout
      t.text :lightning
      t.text :service
      t.text :image
      t.integer :vendor_id
      t.text :hashtag
      
      t.timestamps
    end
  end
end
