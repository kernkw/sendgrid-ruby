require_relative "../../../lib/helpers/subuser_creation/create_subuser"
require_relative "../../../lib/helpers/subuser_creation/subuser"
require_relative "../../../lib/helpers/subuser_creation/api_key"
require_relative '../../../lib/helpers/mail/mail'
require_relative '../../../lib/sendgrid-ruby'

include SendGrid
require 'json'

def create_a_subuser
  subuser = Subuser.new()
  subuser.username = 'test_username_kernkw-4'
  subuser.email = 'kyle.w.kern@gmail.com'
  subuser.password = 'test_password_17689'
  subuser.ips = ['198.37.152.43']
  mail_settings = MailSettings.new
  mail_settings.bcc = BccSettings.new(enable: true, email: 'test@example.com')
  mail_settings.bypass_list_management = BypassListManagement.new(enable: true)
  mail_settings.footer = Footer.new(enable: true, text: 'Footer Text', html: '<html><body>Footer Text</body></html>')
  mail_settings.sandbox_mode = SandBoxMode.new(enable: true)
  mail_settings.spam_check = SpamCheck.new(enable: true, threshold: 1, post_to_url: 'https://spamcatcher.sendgrid.com')
  subuser.mail_settings = mail_settings
  tracking_settings = TrackingSettings.new
  tracking_settings.click_tracking = ClickTracking.new(enable: false, enable_text: false)
  tracking_settings.open_tracking = OpenTracking.new(enable: true, substitution_tag: 'Optional tag to replace with the open image in the body of the message')
  tracking_settings.subscription_tracking = SubscriptionTracking.new(enable: true, text: 'text to insert into the text/plain portion of the message', html: 'html to insert into the text/html portion of the message', substitution_tag: 'Optional tag to replace with the open image in the body of the message')
  tracking_settings.ganalytics = Ganalytics.new(enable: true, utm_source: 'some source', utm_medium: 'some medium', utm_term: 'some term', utm_content: 'some content', utm_campaign: 'some campaign')
  subuser.tracking_settings = tracking_settings
  api_key = APIKey.new
  api_key.name = 'Test API Key 4x'
  api_key.scopes = ''
  subuser.api_key = api_key
  subuser.save!
end

create_a_subuser
