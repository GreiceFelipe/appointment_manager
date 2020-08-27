# frozen_string_literal: true

# app/controllers/home_page_controller.rb
class DashboardController < ApplicationController
  # GET index
  def index
    @options = Doctor.all.map { |p| [p.name, p.id] }

    appointments =
      if params[:doctor_id].blank?
        Appointment.all
      else
        Appointment.where(doctor_id: params[:doctor_id])
      end

    @total_appointments = appointments.count
    @patients_treated = appointments.group(:patient_id).count.size
  end
end
