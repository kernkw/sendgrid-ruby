module SendGrid
  module Mail
    class Substitution

      attr_reader :substitution

      def initialize(key:, value:)
        @substitution = Hash.new.tap { |hash| hash[key] = value }
      end

      def to_json(*)
        {
          'substitution' => substitution
        }.delete_if { |_, value| value.nil? }
      end
    end
  end
end
