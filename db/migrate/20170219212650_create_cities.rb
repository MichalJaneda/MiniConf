class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name, null: false, index: true
      t.belongs_to :country, null: false
    end

    add_index :cities, [:country_id, :name], unique: true

    add_foreign_key :cities, :country
  end
end
