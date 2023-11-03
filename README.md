# Graph models

Visualize Rails model dependencies.

## Install dependencies

```shell
brew install graphviz
```

## Run

```shell
gem build graph_models.gemspec
gem install ./graph_models-0.0.0.gem
bin/graph_models <models_directory> | dot -Tpng -ograph.svg
open graph.svg
```


## Local development

```shell
ruby -Ilib bin/graph_models <models_directory> | dot -Tpng -ograph.svg
open graph.svg
```
