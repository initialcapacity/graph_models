class Dependency
  attr_reader :from, :to, :has_many

  def initialize(from:, to:, has_many:)
    @from = from
    @to = to
    @has_many = has_many
  end
end
