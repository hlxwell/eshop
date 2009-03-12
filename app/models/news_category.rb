class NewsCategory < ActiveRecord::Base
  acts_as_tree :order => "name"
  has_many :news_topics
end
