module SendGrid
  module Mail
    class Header

      attr_accessor :key, :value
      attr_reader :header

      def initialize(key:, value:)
        @key = key
        @value = value
        @header = { key => value }
      end

      def to_json
        {
          'header' => header
        }.delete_if { |_, value| value.nil? }
      end
    end
  end
end
