module SendGrid
  class Subuser
    require 'pry'
    attr_accessor :username, :email, :password, :ips, :mail_settings, :tracking_settings, :api_key

    def initialize(username: nil, email: nil, password: nil, ips: [], mail_settings: nil, tracking_settings: nil, api_key: nil)
      @username = username
      @email = email
      @password = password
      @ips = ips
      @mail_settings = mail_settings
      @tracking_settings = tracking_settings
      @api_key = api_key
    end

    def to_json(*)
      {
        'username' => username,
        'password' => password,
        'email' => email,
        'ips' => ips
      }.delete_if { |_, value| value.to_s.strip == '' }
    end

    def save!
      subuser_create = CreateSubuser.new(subuser: self, sendgrid_client: SendGrid::API.new(api_key: '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').client)
      subuser_response = subuser_create.build_profile
      if !api_key.nil? && subuser_response.status_code == 201
        new_api_key = subuser_create.generate_api_key
        puts "Subuser Created Successfully: #{JSON.parse(subuser_response.body)}"
        puts "API Key Created for subuser: #{JSON.parse(new_api_key.body)}"
        return true
      end
      return false
    end
  end
end