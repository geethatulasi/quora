class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
  has_many :questions,dependent: :destroy
  has_many :answers,dependent: :destroy
  has_many :follow_topics
  has_many :topics, through: :follow_topics,source: :topic

  has_many :followed_users,foreign_key: :follower_id,class_name: 'Follow'
  has_many :followees, through: :followed_users
  has_many :following_users,foreign_key: :followee_id,class_name: 'Follow'
  has_many :followers, through: :following_users
  has_one :profile, dependent: :destroy
end
