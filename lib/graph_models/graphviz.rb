def to_graphviz(dependencies:)
  "digraph D {\n".tap do |result|
    result << "    graph [ranksep=\"3\"];\n"
    dependencies.each do |dep|
      result << "    \"#{dep.from}\" -> \"#{dep.to}\";\n"
    end
  end + "}\n"
end
