class CreateConferences < ActiveRecord::Migration[5.0]
  def change
    create_table :conferences do |t|
      t.belongs_to :host, references: :user, null: false
      t.belongs_to :place, null: false

      t.datetime :starts_at, null: false

      t.string :name, null: false

      t.timestamps
    end

    add_foreign_key :conferences, :host
    add_foreign_key :conferences, :place
  end
end
