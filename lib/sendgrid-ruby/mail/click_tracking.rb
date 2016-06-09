module SendGrid
  module Mail
    class ClickTracking

      attr_accessor :enable, :enable_text

      def initialize(enable:,**args)
        @enable = enable
        @enable_text = args[:enable_text]
      end

      def to_json
        {
          'enable' => enable,
          'enable_text' => enable_text
        }.delete_if { |_, value| value.nil? }
      end
    end
  end
end