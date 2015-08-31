class CreatePerks < ActiveRecord::Migration
  def change
    create_table :perks do |t|
      t.integer :user_id
      t.string  :experience
      t.string    :date
      t.string  :status
    end
  end
end
