module SendGrid
  module Mail
    class Mail
      def initialize(from_email=nil, subj=nil, to_email=nil, cont=nil)
        @from = nil
        @subject = nil
        @personalizations = nil
        @contents = nil
        @attachments = nil
        @template_id = nil
        @sections = nil
        @headers = nil
        @categories = nil
        @custom_args = nil
        @send_at = nil
        @batch_id = nil
        @asm = nil
        @ip_pool_name = nil
        @mail_settings = nil
        @tracking_settings = nil
        @reply_to = nil

        if !(from_email.nil? && subj.nil? && to_email.nil? && cont.nil?)
          self.from = from_email
          self.subject = subj
          personalization = Personalization.new
          personalization.to = to_email
          self.personalizations = personalization
          self.contents = cont
        end
      end

      def from=(from)
        @from = from
      end

      def from
        @from.nil? ? nil : @from.to_json
      end

      def subject=(subject)
        @subject = subject
      end

      def subject
        @subject
      end

      def personalizations=(personalizations)
        @personalizations = @personalizations.nil? ? [] : @personalizations
        @personalizations = @personalizations.push(personalizations.to_json)
      end

      def personalizations
        @personalizations.nil? ? nil : @personalizations
      end

      def contents=(content)
        @contents = @contents ? @contents : []
        @contents = @contents.push(content.to_json)
      end

      def contents
        @contents
      end

      def attachments=(attachments)
        @attachments = @attachments.nil? ? [] : @attachments
        @attachments = @attachments.push(attachments.to_json)
      end

      def attachments
        @attachments
      end

      def template_id=(template_id)
        @template_id = template_id
      end

      def template_id
        @template_id
      end

      def sections=(sections)
        @sections = @sections.nil? ? {} : @sections
        sections = sections.to_json
        @sections = @sections.merge(sections['section'])
      end

      def sections
        @sections
      end

      def headers=(headers)
        @headers = @headers.nil? ? {} : @headers
        headers = headers.to_json
        @headers = @headers.merge(headers['header'])
      end

      def headers
        @headers
      end

      def categories=(category)
        @categories = @categories.nil? ? [] : @categories
        category = category.to_json
        @categories = @categories.push(category['category'])
      end

      def categories
        @categories
      end

      def custom_args=(custom_args)
        @custom_args = @custom_args.nil? ? {} : @custom_args
        custom_args = custom_args.to_json
        @custom_args = @custom_args.merge(custom_args['custom_arg'])
      end

      def custom_args
        @custom_args
      end

      def send_at=(send_at)
        @send_at = send_at
      end

      def send_at
        @send_at
      end

      def batch_id=(batch_id)
        @batch_id = batch_id
      end

      def batch_id
        @batch_id
      end

      def asm=(asm)
        @asm = asm
      end

      def asm
        @asm.nil? ? nil : @asm.to_json
      end

      def ip_pool_name=(ip_pool_name)
        @ip_pool_name = ip_pool_name
      end

      def ip_pool_name
        @ip_pool_name
      end

      def mail_settings=(mail_settings)
        @mail_settings = mail_settings
      end

      def mail_settings
        @mail_settings.nil? ? nil : @mail_settings.to_json
      end

      def tracking_settings=(tracking_settings)
        @tracking_settings = tracking_settings
      end

      def tracking_settings
        @tracking_settings.nil? ? nil : @tracking_settings.to_json
      end

      def reply_to=(reply_to)
        @reply_to = reply_to
      end

      def reply_to
        @reply_to.nil? ? nil : @reply_to.to_json
      end

      def to_json(*)
        {
          'from' => self.from,
          'subject' => self.subject,
          'personalizations' => self.personalizations,
          'content' => self.contents,
          'attachments' => self.attachments,
          'template_id' => self.template_id,
          'sections' => self.sections,
          'headers' => self.headers,
          'categories' => self.categories,
          'custom_args' => self.custom_args,
          'send_at' => self.send_at,
          'batch_id' => self.batch_id,
          'asm' => self.asm,
          'ip_pool_name' => self.ip_pool_name,
          'mail_settings' => self.mail_settings,
          'tracking_settings' => self.tracking_settings,
          'reply_to' => self.reply_to
        }.delete_if { |_, value| value.to_s.strip == '' }
      end
    end
  end
end
