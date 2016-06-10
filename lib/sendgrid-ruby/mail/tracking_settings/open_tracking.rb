module SendGrid
  module Mail
    module TrackingSettings
      class OpenTracking

        attr_accessor :enable, :substitution_tag

        def initialize(enable:, **args)
          @enable = enable
          @substitution_tag = args[:substitution_tag]
        end

        def to_json
          {
            'enable' => enable,
            'substitution_tag' => substitution_tag
          }.delete_if { |_, value| value.nil? }
        end
      end
    end
  end
end