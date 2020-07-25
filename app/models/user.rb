# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  validates :full_name, presence: true

  has_many :travels

  def has_active_travels?
    active_travels = travels.where(active: true)


    active_travels.present?
  end
end
