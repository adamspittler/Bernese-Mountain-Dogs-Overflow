class Answer < ActiveRecord::Base
  # Remember to create a migration!
  include VoteTotal
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :text, :user_id, :question_id, presence: true

end
