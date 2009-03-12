class CreateNewsCategories < ActiveRecord::Migration
  def self.up
    create_table :news_categories do |t|
      t.string :name
      t.integer :parent_id

      t.timestamps
    end
    NewsCategory.create(:name => "root",:parent_id => nil)
  end

  def self.down
    drop_table :news_categories
  end
end
