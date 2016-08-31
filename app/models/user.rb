class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :questions
  has_many :answers
  has_many :comments#, as: :commentable
  has_many :votes#, as: :votable
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: :true, uniqueness: true
end
