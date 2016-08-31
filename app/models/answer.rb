class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :text, :user_id, :question_id, presence: true

end
