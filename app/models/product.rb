class Product < ActiveRecord::Base
  belongs_to :category
  has_many :pictures,:dependent=>:destroy
  has_many :feedbacks,:dependent=>:destroy

  has_many :orders

  def self.per_page
    5
  end

  def after_create
    self.number = "C#{self.category_id}P#{self.id}"
    self.save
  end
end