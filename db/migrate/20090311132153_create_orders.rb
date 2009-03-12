class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :realname
      t.string :idcard
      t.integer :product_id
      t.integer :peoplenum
      t.integer :days
      t.datetime :arrivaldate
      t.string :contact
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
