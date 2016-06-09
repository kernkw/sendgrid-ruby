module SendGrid
  module Mail
    class Content

      attr_accessor :type, :value

      def initialize(type:, value:)
        @type = type
        @value = value
      end

      def to_json
        {
          'type' => type,
          'value' => value
        }.delete_if { |_, value| value.nil? }
      end
    end
  end
end
