# frozen_string_literal: true

# app/models/doctor.rb
class Doctor < ApplicationRecord
  validates :name, presence: true
  validates :crm, presence: true
  validates :crm_uf, presence: true

  validates :crm, uniqueness: { scope: :crm_uf }

  # TODO: 3.1
end
