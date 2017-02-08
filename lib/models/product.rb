require 'active_record'

class Product < ActiveRecord::Base
  validates :name, :category, presence: true
end
