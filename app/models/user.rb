# frozen_string_literal: true

class User < ApplicationRecord
  has_many :collections, dependent: :delete_all
  has_many :items, dependent: :delete_all
  has_many :likes, dependent: :destroy
  has_many :liked_items, through: :likes, source: :item
  has_many :ratings, dependent: :destroy
  has_secure_password
  # mount_uploader :avatar, AvatarUploader
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
end
