module ProjectReportHelper
  def user_name(id)
    User.find(id).first_name + " " + User.find(id).last_name
  end

  def sort_link
    p @sort
    if @sort && @sort[:sort] == 'asc'
      project_report_index_path(:sort => 'desc')
    else
      project_report_index_path :sort => 'asc'
    end
  end
end
