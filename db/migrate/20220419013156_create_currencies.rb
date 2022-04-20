class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :short_name
      t.decimal :monthly_interest
      t.timestamps
    end
  end
end
