module SendGrid
  module Mail
    class SpamCheck

      attr_accessor :enable, :threshold, :post_to_url

      def initialize(**args)
        @enable = args[:enable]
        @threshold = args[:threshold]
        @post_to_url = args[:post_to_url]
      end

      def to_json(*)
        {
          'enable' => enable,
          'threshold' => threshold,
          'post_to_url' => post_to_url
        }.delete_if { |_, value| value.to_s.strip == '' }
      end
    end
  end
end