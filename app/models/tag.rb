# frozen_string_literal: true

class Tag < ApplicationRecord
  attr_accessor :name
  attr_accessor :slug

  belongs_to :blog

  has_and_belongs_to_many :entries
end
