class ApiController < ApplicationController
  respond_to :json

  def extra
    @angajat = User.find_by_internal_id params.require :id

    begin
      @data_start = params.require :data_start
      @data_final = params.require :data_final
    rescue ActionController::ParameterMissing => e

    end
  end

  def concedii

  end
end
