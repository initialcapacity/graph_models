require "graph_models/dependencies"

class DependencyGraph
  def initialize(models_directory:)
    @models_directory = models_directory
  end

  def build
    dependencies = Dependencies.new

    Dir[File.join(@models_directory, "*.rb")].each do |filename|
      classname = File.basename(filename).delete_suffix(".rb")
      File.foreach(filename) do |line|
        line.lstrip!

        prefix = dependencies.dependency_prefix(line:)
        next if prefix.nil?
        dependencies.add(prefix:, classname:, line:)
      end
    end

    dependencies
  end
end
