class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates :starts_at, presence: true, uniqueness: true

  validate :validate_dates 

  private 

  # Validate appointment dates 
  def validate_dates
    return if starts_at.nil? 

    self.ends_at = starts_at + 30*60

    if starts_at.strftime("%H").to_i <= 8
      errors.add(:starts_at, "cannot start before 9h")
    end

    if ends_at.strftime("%H").to_i > 17
      errors.add(:ends_at, "cannot start or end after 18h")
    end

    if starts_at.strftime("%H").to_i == 12
      errors.add(:starts_at, "cannot start at lunchtime")
    end

    if Appointment.where("starts_at <= ? AND ? <= ends_at", ends_at, starts_at).present?
      errors.add(:base, "There are appointment in this range ")
    end

  end



end
