class CreatePictures < ActiveRecord::Migration
    def self.up
        create_table :pictures do |t|
            t.integer :product_id
            t.integer :parent_id
            t.string :filename
            t.integer :size
            t.string :content_type
            t.integer :width
            t.integer :height
            t.string :thumbnail

            t.timestamps
        end
    end

    def self.down
        drop_table :pictures
    end
end
