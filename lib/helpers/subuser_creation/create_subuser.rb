module SendGrid
  require 'base64'
  class CreateSubuser
    attr_reader :subuser, :sendgrid_client

    def initialize(subuser:, sendgrid_client: SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY']).client)
      @subuser = subuser
      @sendgrid_client = sendgrid_client
    end

    def build_profile
      sendgrid_client.subusers.post(request_body: subuser.to_json)
    end

    def generate_api_key
      basic_auth = Base64.strict_encode64("#{subuser.username}:#{subuser.password}")
      request_headers = { 'Authorization' => "Basic #{basic_auth}" }
      sendgrid_client.api_keys.post(request_body: subuser.api_key.to_json,
                                    request_headers: request_headers)
    end

    # def setup_mail_settings
    #   subuser.mail_settings.each do |setting|
    #     handle_error { sendgrid_client.mail_settings.send(settings.name, setting.instance_variables)}
    #   end
    # end

    # def setup_tracking_settings

    # end

    # def setup_event_webhook

    # end

     # def build_whitelabel

    # end

    private

    def handle_error
      response = yield
      raise response.message if !response.success?
    end
  end
end