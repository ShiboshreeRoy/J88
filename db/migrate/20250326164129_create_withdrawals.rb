class CreateWithdrawals < ActiveRecord::Migration[7.2]
  def change
    create_table :withdrawals do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :amount
      t.string :status

      t.timestamps
    end
  end
end
