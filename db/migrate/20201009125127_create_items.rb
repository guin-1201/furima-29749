class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product,                    null: false
      t.text :description,                  null: false
      t.integer :category_id,               null: false
      t.integer :status_id,                 null: false
      t.integer :shipping_charge_class_id,  null: false
      t.integer :ship_address_id,           null: false
      t.integer :ship_date_class_id,        null: false
      t.integer :price,                     null: false
      t.timestamps
    end
  end
end
