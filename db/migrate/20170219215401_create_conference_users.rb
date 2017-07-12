class CreateConferenceUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :conference_users do |t|
      t.belongs_to :conference, null: false
      t.belongs_to :user, null: false

      t.integer :rank, null: false, index: true

      t.boolean :confirmed, null: false, default: false, index: true
      t.string :confirmation_token, null: false, unique: true
      t.datetime :confirmation_date, index: true

      t.timestamps
    end

    add_index :conference_users, :created_at
    add_index :conference_users, [:conference_id, :user_id], unique: true, name: 'idx_unique_cid_uid'
    add_index :conference_users, [:conference_id, :user_id, :confirmed], name: 'idx_cid_uid_conf'

    add_foreign_key :conference_users, :conference
    add_foreign_key :conference_users, :user
  end
end
