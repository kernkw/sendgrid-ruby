module SendGrid
  class APIKey
    attr_accessor :name, :scopes

    def initialize(name: nil, scopes: nil)
      @name = name
      @scopes = scopes
    end

    def to_json(*)
      {
        'name' => name,
        'scopes' => scopes
      }.delete_if { |_, value| value.to_s.strip == '' }
    end
  end
end