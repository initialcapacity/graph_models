require "graph_models/dependency_graph"
require "graph_models/graphviz"

def print_dependencies(models_directory:)
  dependencies = DependencyGraph.new(models_directory: models_directory).build
  print to_graphviz(dependencies:)
end
