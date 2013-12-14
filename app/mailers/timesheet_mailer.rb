class TimesheetMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.timesheet_mailer.submit.subject
  #
  def submit
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
