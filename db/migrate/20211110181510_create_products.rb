class CreateProducts < ActiveRecord::Migration[6.1]
  def up
    create_table :products do |t|
      t.string :name, null: false, unique: true
      t.bigint :price_in_cents, null: false

      t.timestamps
    end
  end

  def down
    drop_table :products
  end
end
