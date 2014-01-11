class ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token, :authenticate_user!

  respond_to :json

  def extra
    @employee = User.find_by_internal_id params.require :id

    begin
      @data_start = params.require :data_start
      @data_final = params.require :data_final
    rescue ActionController::ParameterMissing => e

    end


  end

  def concedii
    @employee = User.find_by_internal_id params.require :id

    unless @employee
      render json: {error: 'Angajatul nu a fost gasit'}, status: :not_acceptable
      return
    end

    begin
      @data_start = params.require :data_start
      @data_final = params.require :data_final

    rescue ActionController::ParameterMissing => e
      @data_start = Date.new 0
      @data_final = Date.today
    end

    @holidays = @employee.tasks.where(activity: 'vacanta', created_at: @data_start .. @data_final).inject(0)  {|acc, x| acc + x.number_of_hours}
    @sick = @employee.tasks.where(activity: 'concediu medical', created_at: @data_start .. @data_final).inject(0)  {|acc, x| acc + x.number_of_hours}
    render json: {holiday: @holidays, sick: @sick}
  end
end
