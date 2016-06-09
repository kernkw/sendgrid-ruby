module SendGrid
  module Mail
    class BypassListManagement
      attr_accessor :enable

      def initialize(enable:)
        @enable = enable
      end

      def to_json
        {
          'enable' => enable
        }.delete_if { |_, value| value.nil? }
      end
    end
  end
end