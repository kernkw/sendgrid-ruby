module SendGrid
  module Mail
    class Section

      attr_reader :section

      def initialize(key:, value:)
        @section = Hash.new.tap { |hash| hash[key] = value }
      end

      def to_json
        {
          'section' => section
        }.delete_if { |_, value| value.nil? }
      end
    end
  end
end
