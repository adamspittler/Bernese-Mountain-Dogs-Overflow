class Question < ActiveRecord::Base
  # Remember to create a migration!
  include VoteTotal
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :title, :text, :user_id, presence: true
end
