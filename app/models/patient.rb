# frozen_string_literal: true

# app/models/patient.rb
class Patient < ApplicationRecord
  validates :name, presence: true
  validates :birth_date, presence: true
  validates :cpf, presence: true, uniqueness: true

  validates :cpf,
            format: {
              with: /\A\d{3}\.\d{3}\.\d{3}-\d{2}\Z/,
              message: 'is not valid. '
            }
end
