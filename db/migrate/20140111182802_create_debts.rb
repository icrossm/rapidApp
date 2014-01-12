class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.integer :user_id
      t.integer :friend_id
      t.integer :amount
      t.integer :type
      t.date :expirity
      t.integer :status

      t.timestamps
    end
  end
end
