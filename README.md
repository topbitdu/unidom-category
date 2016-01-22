# Unidom Category

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Category domain model engine includes Category and its relative models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。类别领域模型引擎包括类别及其相关的模型。

## Usage in Gemfile:
```ruby
gem 'unidom-category'
```

## Run the Database Migration:
```shell
rake db:migrate
```

## Call the Model:
```ruby
Unidom::Category::Category.coded_as('x1').scheme_is(scheme).valid_at.alive.first
```
