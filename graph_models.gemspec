Gem::Specification.new do |s|
  s.name = "graph_models"
  s.version = "0.0.0"
  s.summary = "Graphs a Rails project's models"
  s.description = "Graphs a Rails project's models"
  s.authors = ["Tyson Gern"]
  s.email = "tyson@initialcapacity.io"
  s.files = [
    "lib/graph_models.rb",
    "lib/graph_models/dependency_graph.rb",
    "lib/graph_models/dependencies.rb",
    "lib/graph_models/dependency.rb",
    "lib/graph_models/graphviz.rb",
  ]
  s.add_runtime_dependency "activesupport"
end
