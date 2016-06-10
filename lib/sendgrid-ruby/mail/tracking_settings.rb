module SendGrid
  module Mail
    class TrackingSettings

      attr_accessor :click_tracking, :open_tracking, :subscription_tracking, :ganalytics

      def initialize(**args)
        @click_tracking = args[:click_tracking]
        @open_tracking = args[:open_tracking]
        @subscription_tracking = args[:subscription_tracking]
        @ganalytics = args[:ganalytics]
      end

      def to_json
        {
          'click_tracking' => try_json(click_tracking),
          'open_tracking' => try_json(open_tracking),
          'subscription_tracking' => try_json(subscription_tracking),
          'ganalytics' => try_json(ganalytics)
        }.delete_if { |_, value| value.nil? }
      end

      private

      def try_json(tracking)
        tracking.nil? ? nil : tracking.to_json
      end
    end
  end
end