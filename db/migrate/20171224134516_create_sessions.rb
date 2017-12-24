class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.references :account, foreign_key: true, null: false
      t.string :token, null: false

      t.timestamps
    end

    add_index :sessions, :token, unique: true
  end
end
