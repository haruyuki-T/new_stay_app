class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :room, optional: true

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :people, presence: true, numericality: true
  validate :start_date_check
  validate :end_date_check

  def start_date_check
    return if start_date.blank?
    errors.add(:start_date,"は今日以降のものを選択してください") if start_date < Date.today
  end

  def end_date_check
    return if end_date.blank? || start_date.blank?
    errors.add(:end_date, "は開始日以降のものを選択してください") if end_date < start_date
  end

  def stay_days
    (end_date - start_date).to_i
  end

  def sum_of_price
    room.price * people * stay_days
  end

end
