class CreateNewsTopics < ActiveRecord::Migration
  def self.up
    create_table :news_topics do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end

  def self.down
    drop_table :news_topics
  end
end
