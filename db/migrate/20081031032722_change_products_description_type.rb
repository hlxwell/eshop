class ChangeProductsDescriptionType < ActiveRecord::Migration
  def self.up
    change_column :products,:description,:text
    change_column :settings,:value,:text
    change_column :news_topics,:body,:text
  end

  def self.down
    change_column :products,:description,:string
    change_column :settings,:value,:string
    change_column :news_topics,:body,:string
  end
end
