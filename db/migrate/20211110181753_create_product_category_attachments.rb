class CreateProductCategoryAttachments < ActiveRecord::Migration[6.1]
  def up
    create_table :product_category_attachments do |t|
      t.references :product, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :product_category_attachments
  end
end
