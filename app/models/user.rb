# frozen_string_literal: true

class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  has_many :comments, dependent: :destroy, inverse_of: :comment
  has_many :entries, dependent: :destroy, inverse_of: :entry

  def full_name
    "#{first_name} #{last_name}"
  end

  def initials
    "#{first_name.first.upcase} #{last_name.first.update}"
  end
end
