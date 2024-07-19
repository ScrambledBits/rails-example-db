# frozen_string_literal: true

# The ApplicationMailer class is the base class for all mailers in the application.
# It sets the default email sender and layout for all mailers.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
