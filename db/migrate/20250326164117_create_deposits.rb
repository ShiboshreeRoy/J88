class CreateDeposits < ActiveRecord::Migration[7.2]
  def change
    create_table :deposits do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :amount
      t.string :status
      t.string :transaction_code
      t.string :image

      t.timestamps
    end
  end
end
