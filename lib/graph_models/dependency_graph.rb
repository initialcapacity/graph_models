require "graph_models/dependency"

class DependencyGraph
  def initialize(models_directory:)
    @models_directory = models_directory
  end

  def build
    dependencies = []

    Dir[File.join(@models_directory, "*.rb")].each do |filename|
      classname = File.basename(filename).delete_suffix(".rb")
      File.foreach(filename) do |line|
        line.lstrip!

        if line.start_with?("has_many")
          depends_on = line.delete_prefix("has_many :").split(",")[0].delete_suffix("\n")
          dependencies << Dependency.new(from: classname, to: depends_on)
        end

        if line.start_with?("belongs_to")
          depends_on = line.delete_prefix("belongs_to :").split(",")[0].delete_suffix("\n")
          dependencies << Dependency.new(from: classname, to: depends_on)
        end
      end
    end

    dependencies
  end
end
