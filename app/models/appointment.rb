# frozen_string_literal: true

# app/models/appointment.rb
class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates :starts_at, presence: true, uniqueness: true

  validate :validate_dates

  private

  # Validate appointment dates
  def validate_dates # rubocop:disable Metrics/AbcSize
    return if starts_at.nil?

    self.ends_at = starts_at + 30 * 60

    errors.add(:starts_at, 'cannot start before 9h') if Integer(starts_at.strftime('%H'), 10) <= 8

    errors.add(:ends_at, 'cannot start or end after 18h') if Integer(ends_at.strftime('%H'), 10) > 17

    errors.add(:starts_at, 'cannot start at lunchtime') if Integer(starts_at.strftime('%H'), 10) == 12
    errors.add(:base, 'There are appointment in this range ') if Appointment.where('starts_at <= ? AND ? <= ends_at', ends_at, starts_at).present?
  end
end
