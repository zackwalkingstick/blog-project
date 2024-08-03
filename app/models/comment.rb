# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :creator, class_name: 'User'
  belongs_to :entry
end
