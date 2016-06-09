# Quickly and easily access the SendGrid API.
require 'ruby_http_client'
require "sendgrid-ruby/mail/asm"
require "sendgrid-ruby/mail/attachment"
require "sendgrid-ruby/mail/bcc_settings"
require "sendgrid-ruby/mail/bypass_list_management"
# require "sendgrid-ruby/mail/category"
# require "sendgrid-ruby/mail/click_tracking"
# require "sendgrid-ruby/mail/content"
# require "sendgrid-ruby/mail/custom_arg"
# require "sendgrid-ruby/mail/email"
# require "sendgrid-ruby/mail/footer"
# require "sendgrid-ruby/mail/ganalytics"
# require "sendgrid-ruby/mail/header"
# require "sendgrid-ruby/mail/mail"
# require "sendgrid-ruby/mail/mail_settings"
# require "sendgrid-ruby/mail/open_tracking"
# require "sendgrid-ruby/mail/personalization"
# require "sendgrid-ruby/mail/sandbox_mode"
# require "sendgrid-ruby/mail/section"
# require "sendgrid-ruby/mail/spam_check"
# require "sendgrid-ruby/mail/subscription_tracking"
# require "sendgrid-ruby/mail/substitution"
# require "sendgrid-ruby/mail/tracking_settings"

# require "sendgrid-ruby/task"
# require "sendgrid-ruby/account_settings"
# require "sendgrid-ruby/api_key"
# require "sendgrid-ruby/create_subuser"
# require "sendgrid-ruby/tasks/task"
# require "sendgrid-ruby/subuser"
# require "sendgrid-ruby/tasks/build_profile_task"
# require "sendgrid-ruby/tasks/composite_task"
# require "sendgrid-ruby/tasks/create_subuser_task"
# require "sendgrid-ruby/tasks/generate_api_key_task"
# require "sendgrid-ruby/tasks/setup_mail_settings_task"
# require "sendgrid-ruby/tasks/setup_tracking_settings_task"

module SendGrid
  # Initialize the HTTP client
  class API
    attr_accessor :client
    attr_reader :VERSION, :request_headers, :host, :version
    # * *Args*    :
    #   - +api_key+ -> your SendGrid API key
    #   - +host+ -> the base URL for the API
    #   - +request_headers+ -> any headers that you want to be globally applied
    #   - +version+ -> the version of the API you wish to access,
    #                  currently only "v3" is supported
    #
    def initialize(api_key: nil, host: nil, request_headers: nil, version: nil)
      @VERSION = '2.0.0'
      @api_key          = api_key
      @host             = host ? host : 'https://api.sendgrid.com'
      @version          = version ? version : 'v3'
      @user_agent       = "sendgrid/#{@VERSION};ruby"
      @request_headers  = JSON.parse('
        {
          "Authorization": "Bearer ' + @api_key + '",
          "Content-Type": "application/json"
        }
      ')

      @request_headers = @request_headers.merge(request_headers) if request_headers
      @client = Client.new(host: "#{@host}/#{@version}",
                           request_headers: @request_headers)
    end
  end
end
