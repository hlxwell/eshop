class Order < ActiveRecord::Base
  belongs_to :product,:dependent=>:destroy
end
