class TimesheetMailer < ActionMailer::Base
  default from: "isi@cloudients.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.timesheet_mailer.submit.subject
  #
  def submit(ms)
    @name = ms.user.first_name + ' ' + ms.user.last_name
    @link = 'http://' + dashboard_path(ms.id)
    
    ms.user.department.users.select  do |u|
       if u.has_role? :dept_chief
	 mail to: u.email, subject: 'Pontaj trimis spre aprobare'
       end
    end
  end
  
  def remember(employee)
     mail to: employee.email, subject: 'Pontajul nu a fost trimis spre aprobare'
  end
end
