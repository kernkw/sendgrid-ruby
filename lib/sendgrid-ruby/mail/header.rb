module SendGrid
  module Mail
    class Header

      attr_accessor :key, :value

      def initialize(key:, value:)
        @key = key
        @value = value
      end

      def to_json
        { key => value }
      end
    end
  end
end
