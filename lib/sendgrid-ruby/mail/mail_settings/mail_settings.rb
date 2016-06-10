module SendGrid
  module Mail
    module MailSettings
      class MailSettings

        attr_accessor :bcc, :bypass_list_management, :footer, :sandbox_mode, :spam_check

        def initilize(**args)
          @bcc = args[:bcc]
          @bypass_list_management = args[:bypass_list_management]
          @footer = args[:footer]
          @sandbox_mode = args[:sandbox_mode]
          @spam_check = args[:spam_check]
        end

        def to_json
          {
            'bcc' => try_json(bcc),
            'bypass_list_management' => try_json(bypass_list_management),
            'footer' => try_json(footer),
            'sandbox_mode' => try_json(sandbox_mode),
            'spam_check' => try_json(spam_check)
          }.delete_if { |_, value| value.nil? }
        end

        private

        def try_json(setting)
          setting.nil? ? nil : setting.to_json
        end
      end
    end
  end
end