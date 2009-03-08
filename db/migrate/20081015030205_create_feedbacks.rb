class CreateFeedbacks < ActiveRecord::Migration
    def self.up
        create_table :feedbacks do |t|
            t.integer :product_id
            t.string :name
            t.string :email
            t.string :content

            t.timestamps
        end
    end

    def self.down
        drop_table :feedbacks
    end
end
