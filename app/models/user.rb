# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password

  validates :password, length: { minimum: 8 }, if: Proc.new{ |user| user.password.present? || user.new_record? }
  validates :email, uniqueness: true, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :username, length: { minimum: 5 }, on: :update

  before_create :assign_default_username

  def self.authenticate(email:, password: )
    user = User.find_by(email: email)
    return false if user.blank?
    if user.authenticate(password)
      return user
    else 
      return false
    end
  end

  private
  def assign_default_username
    self.username = self.email.split('@').first
  end
end
