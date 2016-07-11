class Comment < ActiveRecord::Base
  belongs_to :book
  belongs_to :user
  validates :desc, presence: true
  validates :user_id, presence: true,
                          numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :book_id, presence: true,
                          numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
