require 'test_helper'

class TimesheetMailerTest < ActionMailer::TestCase
  test "submit" do
    mail = TimesheetMailer.submit
    assert_equal "Submit", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
