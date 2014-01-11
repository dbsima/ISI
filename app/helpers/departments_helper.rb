module DepartmentsHelper
  def sort_link
    p @sort
    if @sort && @sort[:sort] == 'asc'
      department_path(@id, :sort => 'desc')
    else
      department_path @id, :sort => 'asc'
    end
  end
end
