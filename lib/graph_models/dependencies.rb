require "graph_models/dependency"
require "active_support/inflector"

class Dependencies
  include Enumerable

  def initialize
    @list = []
  end

  def each(&block)
    @list.each(&block)
  end

  def dependency_prefix(line:)
    if line.start_with?("has_many")
      "has_many"
    elsif line.start_with?("has_one")
      "has_one"
    elsif line.start_with?("belongs_to")
      "belongs_to"
    else
      nil
    end
  end

  def add(prefix:, classname:, line:)
    depends_on = line.delete_prefix("#{prefix} :").split(",")[0].delete_suffix("\n")
    self << Dependency.new(from: classname, to: depends_on.singularize, has_many: prefix.start_with?("has"))
  end

  private

  def <<(val)
    @list << val
  end
end
