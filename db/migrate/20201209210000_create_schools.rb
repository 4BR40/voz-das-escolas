class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :location
      t.decimal :lat, precision: 12, scale: 8
      t.decimal :lng, precision: 12, scale: 8

      t.timestamps
    end
  end
end
