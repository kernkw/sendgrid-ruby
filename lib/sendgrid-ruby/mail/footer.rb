module SendGrid
  module Mail
    class Footer

      attr_accessor :enable, :text, :html

      def initialize(enable:, **args)
        @enable = enable
        @text = args[:text]
        @html = args[:html]
      end

      def to_json
        {
          'enable' => enable,
          'text' => text,
          'html' => html
        }.delete_if { |_, value| value.nil? }
      end
    end
  end
end