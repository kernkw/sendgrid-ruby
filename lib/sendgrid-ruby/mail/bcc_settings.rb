# TODO: Add params sigunature from sendgrid docs
# TODO: this should not be pluralized
# TODO: Why was enabled in here? Check spotlight for actually params for this endpoint
module SendGrid
  module Mail
    class BccSettings

      attr_accessor :email, :name

      def initialize(email:, **args)
        @email = email
        @name = args[:name]
      end

      def to_json
        {
          'email' => email,
          'name' => name
        }.delete_if { |_, value| value.nil? }
      end
    end
  end
end
