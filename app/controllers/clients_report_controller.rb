class ClientsReportController < ApplicationController
  def index
    begin
      pars = params.require(:report_date).permit :date_start, :date_finish
    rescue ActionController::ParameterMissing => e

    end

    @clients = {}

    Client.all.each do |c|
      @clients[c.name] = {}
      c.projects.each do |p|
        @clients[c.name][p.name] = p.tasks.inject(0)  {|acc, x| acc + x.number_of_hours}
      end
    end
  end
end
