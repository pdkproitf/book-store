class Category < ActiveRecord::Base
  have_many :books, dependent :destroy
end
