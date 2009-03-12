class AddNewsCategoryIdToNewsTopic < ActiveRecord::Migration
  def self.up
    add_column :news_topics, :news_category_id, :integer
  end

  def self.down
    remove_column :news_topics, :news_category_id
  end
end
