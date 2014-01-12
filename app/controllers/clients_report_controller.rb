class ClientsReportController < ApplicationController
  include Concerns::DateSelect

  before_filter :get_date_params
  def index
    @clients = {}

    Client.all.each do |c|
      @clients[c.name] = {}
      c.projects.each do |p|
        @clients[c.name][p.name] = filter_tasks_by_date_params(p.tasks).inject(0)  {|acc, x| acc + x.number_of_hours}
      end
    end
  end
end
