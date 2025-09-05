class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :number_of_persons, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :start_time_end_time_check

  private

  def start_time_end_time_check
    if start_time >= end_time
      errors.add(:end_time, "は予約開始時間よりも遅くなければなりません。")
    end
  end


end
