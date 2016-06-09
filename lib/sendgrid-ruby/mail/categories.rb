module SendGrid
  module Mail
    class Categories

      attr_accessor :categories

      def initialize(categories:)
        @categories = categories
      end

      def to_json
        {
          'categories' => categories
        }.delete_if { |_, value| value.nil? }
      end
    end
  end
end
