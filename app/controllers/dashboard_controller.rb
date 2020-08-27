# frozen_string_literal: true

# app/controllers/home_page_controller.rb
class DashboardController < ApplicationController
  # GET index
  def index 
    @options = Doctor.all.collect {|p| [ p.name, p.id ] }

    if params[:doctor_id].blank?
      appointments = Appointment.all
    else
      appointments = Appointment.where(doctor_id: params[:doctor_id])
    end

    @total_appointments = appointments.count 
    @patients_treated = appointments.group(:patient_id).count.size
  end
end
