# Required params: group_id
# => Type: int
# Optional params: groups_to_display
# => Type: array of ints
# => Max: 25
module SendGrid
  module Mail
    class ASM

      attr_accessor :group_id, :groups_to_display

      def initialize(group_id:, **args)
        @group_id = group_id
        @groups_to_display = args[:groups_to_display]
      end

      def to_json
        {
          'group_id' => group_id,
          'groups_to_display' => groups_to_display
        }.delete_if { |_, value| value.nil? }
      end
    end
  end
end