class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions, id: false do |t|
      t.integer :id, primary_key: true
      t.references :invoice, foreign_key: true
      t.integer :credit_card_number
      t.datetime :credit_card_expiration_date
      t.integer :result

      t.timestamps
    end
  end
end
