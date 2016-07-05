class Book < ActiveRecord::Base
  belongs_to :category
  belongs_to :publish
end
