module ProjectReportHelper
  def user_name(id)
    User.find(id).first_name + " " + User.find(id).last_name
  end
end
