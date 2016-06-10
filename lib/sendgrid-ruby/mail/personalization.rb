module SendGrid
  module Mail
    class Personalization

      attr_accessor :tos, :ccs, :bccs, :subject, :headers, :substitution, :custom_args, :send_at

      def initialize(tos:, **args)
        @tos = to
        @ccs = args[:cc]
        @bccs = args[:bcc]
        @subject = args[:subject]
        @headers = args[:header]
        @substitutions = args[:substitutions]
        @custom_arg = args[:custom_arg]
        @send_at = args[:send_at]
      end


      def to_json(*)
        {
          'to' => jsonify(to),
          'cc' => jsonify(cc),
          'bcc' => jsonify(bcc),
          'subject' => subject,
          'headers' => headers.inject({}) { |mem, header| mem.merge(header) },
          'substitutions' => substitution,
          'custom_args' => custom_arg,
          'send_at' => send_at
        }.delete_if { |_, value| value.nil? }
      end

      private

      def jsonify(parts)
        parts.map { |part| part.to_json }
      end
    end
  end
end
