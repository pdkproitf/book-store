class Category < ActiveRecord::Base
  has_many :books
  validates :name,  presence: true,
                    length: { maximum: 50,
                              message: "can't be longer than 50 characters" },
                    uniqueness: true


end
