class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
    end

    add_index :accounts, :email, unique: true
  end
end
