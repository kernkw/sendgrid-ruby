module SendGrid
  class Category
    def initialize(name: nil)
      @category = name
    end

    def category=(category)
      @category = category
    end

    def category
      @category
    end

    def to_json(*)
      {
        'category' => self.category
      }.delete_if { |_, value| value.to_s.strip == '' }
    end
  end
end
