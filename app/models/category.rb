# frozen_string_literal: true

class Category < ApplicationRecord
  validates :description, presence: true
  validates :description, length: { maximum: 256 }

  has_many :travels
end
