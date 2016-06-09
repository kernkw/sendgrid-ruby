# TODO: Add params sigunature from sendgrid docs
module SendGrid
  module Mail
    class Attachment

      attr_accessor :content, :filename, :type, :disposition, :content_id

      def initialize(content:, filename:, **args)
        @content = content
        @filename = filename
        @type = args[:type]
        @disposition = args[:disposition]
        @content_id = args[:content_id]
      end

      def to_json(*)
        {
          'content' => content,
          'type' => type,
          'filename' => filename,
          'disposition' => disposition,
          'content_id' => content_id
        }.delete_if { |_, value| value.nil? }
      end
    end
  end
end
