def to_graphviz(dependencies:)
  "digraph D {\n".tap do |result|
    result << "    graph [ranksep=\"7\"];\n"
    dependencies.each do |dep|
      suffix = dep.has_many ? " [color=\"red\"]" : ""
      result << "    \"#{dep.from}\" -> \"#{dep.to}\"#{suffix};\n"
    end
  end + "}\n"
end
