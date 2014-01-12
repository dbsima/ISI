class ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token, :authenticate_user!

  before_filter :check_employee, :check_time

  respond_to :json

  def extra
    @hours = @vacancy_hours = 0
    @employee.daily_sheets.where(date: @data_start .. @data_final).each do |ds|
      p ds.tasks.where('activity NOT IN (?)', )
      ds.tasks.each do |t|
        if ['vacanta', 'concediu medical'].include? t.activity
          @vacancy_hours += t.number_of_hours
        else
          @hours += t.number_of_hours
        end
      end
    end

    p @hours
    @norm = (@data_final - @data_start).to_i * 8 - @vacancy_hours

    @extra = @hours - @norm

    render json: {norm: @norm, extra: @extra}
  end

  def concedii
    @holidays = @employee.tasks.where(activity: 'vacanta', created_at: @data_start .. @data_final).inject(0)  {|acc, x| acc + x.number_of_hours}
    @sick = @employee.tasks.where(activity: 'concediu medical', created_at: @data_start .. @data_final).inject(0)  {|acc, x| acc + x.number_of_hours}
    render json: {holiday: @holidays, sick: @sick}
  end

private
  def check_employee
    @employee = User.find_by_internal_id params.require :id

    unless @employee
      render json: {error: 'Angajatul nu a fost gasit'}, status: :not_acceptable
      return
    end
  end

  def check_time
    begin
      @data_start = Date.parse params.require :data_start
      @data_final = Date.parse params.require :data_final

    rescue ActionController::ParameterMissing => e
      @data_start = Date.new 0
      @data_final = Date.today
    end
  end
end
