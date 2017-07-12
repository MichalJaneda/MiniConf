class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.belongs_to :city, null: false, index: true
      t.string :street

      t.float :latitude
      t.float :longitude
    end

    add_foreign_key :places, :city
  end
end
