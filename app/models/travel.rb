# frozen_string_literal: true

class Travel < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user

  validates :grade, numericality: { greater_than: 0, less_than_or_equal_to: 5 }

  def time_spent
    travel_start_dt = to_utc(started_date)
    travel_finish_dt = to_utc(end_date)

    travel_finish_dt - travel_start_dt
  end

  private

  def to_utc(date)
    date.utc
  end
end
