# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validate :image_type

  private

  def image_type
    errors.add(:image, 'はjpg,png,gif形式のものにして下さい') if image.attached? && !image.content_type.in?(%('image/jpeg image/png image/gif'))
  end
end
