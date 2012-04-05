class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.text :description
      t.date :start_time
      t.date :end_time
      t.float :credit_price
      t.float :purchase_price
      t.float :discount_price
      t.string :status
      t.string :store_image_file_name
      t.string :store_image_content_type
      t.integer :store_image_file_size
      t.integer :category_id

      t.timestamps

    end
  end

  def self.down
    drop_table :products
  end
end
