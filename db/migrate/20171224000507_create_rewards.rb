class CreateRewards < ActiveRecord::Migration[5.1]
  def change
    create_table :rewards do |t|
      t.references :account, foreign_key: true, null: false
      t.integer :status, null: false

      t.timestamps
    end

    add_index :rewards, :status
  end
end
