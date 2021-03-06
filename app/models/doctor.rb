# frozen_string_literal: true

# app/models/doctor.rb
class Doctor < ApplicationRecord
  has_many :appointments

  validates :name, presence: true
  validates :crm, presence: true
  validates :crm_uf, presence: true

  validates :crm, uniqueness: { scope: :crm_uf }

  before_destroy :check_for_appointments

  private

  def check_for_appointments
    unless appointments.blank? # rubocop:disable Style/GuardClause
      errors.add(:base, 'cannot delete doctor while appointments exist')
      throw(:abort)
    end
  end
end
