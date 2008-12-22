class AddHtmlDescriptionToProducts < ActiveRecord::Migration
    def self.up
        add_column :products,:html_description,:string
    end

    def self.down
        remove_column :products,:html_description
    end
end
