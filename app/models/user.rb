# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :active_relations, class_name: 'UserRelation', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relations, class_name: 'UserRelation', foreign_key: 'followed_id', dependent: :destroy
  has_many :following, through: :active_relations, source: :followed
  has_many :followers, through: :passive_relations

  def follow(other_user)
    active_relations.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relations.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
