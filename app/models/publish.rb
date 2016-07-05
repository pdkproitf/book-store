class Publish < ActiveRecord::Base
  have_many :books, dependent :destroy
end
