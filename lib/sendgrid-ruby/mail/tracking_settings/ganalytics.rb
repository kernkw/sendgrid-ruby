module SendGrid
  module Mail
    module TrackingSettings
      class Ganalytics

        attr_accessor :enable, :utm_source, :utm_medium, :utm_term, :utm_content, :utm_campaign

        def initialize(enable:, **args)
          @enable = enable
          @utm_source = args[:utm_source]
          @utm_medium = args[:utm_medium]
          @utm_term = args[:utm_term]
          @utm_content = args[:utm_content]
          @utm_campaign = args[:utm_campaign]
        end

        def to_json(*)
          {
            'enable' => enable,
            'utm_source' => utm_source,
            'utm_medium' => utm_medium,
            'utm_term' => utm_term,
            'utm_content' => utm_content,
            'utm_campaign' => utm_campaign
          }.delete_if { |_, value| value.nil? }
        end
      end
    end
  end
end
