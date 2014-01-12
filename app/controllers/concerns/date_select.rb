module Concerns
  module DateSelect
    def get_date_params
      begin
        pars = params.require(:report_date).permit :date_start, :date_finish
        p pars
        @date_start = Date.new pars['date_start(1i)'].to_i, pars['date_start(2i)'].to_i, pars['date_start(3i)'].to_i
        @date_finish = Date.new pars['date_finish(1i)'].to_i, pars['date_finish(2i)'].to_i, pars['date_finish(3i)'].to_i
      rescue ActionController::ParameterMissing => e
        @date_start = Date.parse '2012-11-11'
        @date_finish = Date.today
      end
    end

    def filter_tasks_by_date_params(tasks)
      tasks.select do |t|
        if t && t.daily_sheet && t.daily_sheet.date >= @date_start && t.daily_sheet.date <= @date_finish
          t
        end
      end
    end
  end
end