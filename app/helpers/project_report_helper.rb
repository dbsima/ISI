module ProjectReportHelper
  def user_name(id)
    User.find(id).first_name + " " + User.find(id).last_name
  end

  def sort_link
    p @sort
    if @sort && @sort[:sort] == 'asc'
      department_path(@id, :sort => 'desc')
    else
      department_path @id, :sort => 'asc'
    end
  end
end
