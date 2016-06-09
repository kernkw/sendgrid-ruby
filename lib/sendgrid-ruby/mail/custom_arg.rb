module SendGrid
  module Mail
    class CustomArg

      attr_accessor :key, :value
      attr_reader :custom_arg

      def initialize(key:, value:)
        @key = key
        @value = value
        @custom_arg = { key => value }
      end

      def to_json
        {
          'custom_arg' => custom_arg
        }.delete_if { |_, value| value.nil? }
      end
    end
  end
end
