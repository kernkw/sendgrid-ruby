module SendGrid
  module Mail
    module TrackingSettings
      class SubscriptionTracking

        attr_accessor :enable, :text, :html, :substitution_tag

        def initialize(**args)
          @enable = args[:enable]
          @text = args[:text]
          @html = args[:html]
          @substitution_tag = args[:substitution_tag]
        end

        def to_json(*)
          {
            'enable' => enable,
            'text' => text,
            'html' => html,
            'substitution_tag' => substitution_tag
          }.delete_if { |_, value| value.nil? }
        end
      end
    end
  end
end