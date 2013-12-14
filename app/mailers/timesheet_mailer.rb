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
    mail to: User.find(ms.user.department.chief_id).email, subject: 'Pontaj trimis spre aprobare'
  end
end
