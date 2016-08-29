# Unidom Category 类别领域模型引擎

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/unidom-category.svg)](https://badge.fury.io/rb/unidom-category)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Category domain model engine includes Category and its relative models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。类别领域模型引擎包括类别及其相关的模型。

## Recent Update
Check out the [Road Map](ROADMAP.md) to find out what's the next.
Check out the [Change Log](CHANGELOG.md) to find out what's new.

## Usage in Gemfile
```ruby
gem 'unidom-category'
```

## Run the Database Migration
```shell
rake db:migrate
```
The migration versions start with 200003.

## Call the Model
```ruby
@category = Unidom::Category::Category.coded_as('x1').scheme_is(scheme).valid_at.alive.first
Unidom::Category::Categorizing.categorize! product, into: category, at: Time.now

Unidom::Category::CategoryRollup.roll_up! child_category, into: parent_category, at: Time.now

# Add the @product into the @category.
@category.categorize! @product, primary: true
```

## Include the Concerns
```ruby
include Unidom::Category::Concerns::AsCategorized
```

### As Categorized concern
The As Categorized concern do the following tasks for the includer automatically:  
1. Define the has_many :categorizings macro as: ``has_many :categorizings, class_name: 'Unidom::Category::Categorizing', as: :categorized``
2. Define the has_many :categories macro as: ``has_many :categories, through: :categorizings, source: :category``
