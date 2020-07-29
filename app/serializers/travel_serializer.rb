# frozen_string_literal: true

class TravelSerializer < ActiveModel::Serializer
  attributes :id, :grade, :spent_time, :category, :user

  def spent_time
    object.time_spent
  end
end
