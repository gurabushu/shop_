class Shop < ApplicationRecord

  validates :title, presence: true
  validates :category, presence: true
  validates :open_time, presence: true
  validates :close_time, presence: true

  private

  def open_time_close_time_check
    if open_time >= close_time
      errors.add(:close_time, "は開店時間よりも遅くなければなりません。")
    end
  end


end
