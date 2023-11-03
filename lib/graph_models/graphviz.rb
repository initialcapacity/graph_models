def to_graphviz(dependencies:)
  "digraph D {\n".tap do |result|
    result << "    graph [ranksep=\"7\"];\n"
    dependencies.each do |dep|
      if dep.has_many
        result << "    \"#{dep.from}\" -> \"#{dep.to}\" [color=\"red\"];\n"
      else
        result << "    \"#{dep.from}\" -> \"#{dep.to}\";\n"
      end
    end
  end + "}\n"
end
