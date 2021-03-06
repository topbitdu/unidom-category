# Unidom Category 类别领域模型引擎

[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/gems/unidom-category/frames)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)

[![Gem Version](https://badge.fury.io/rb/unidom-category.svg)](https://badge.fury.io/rb/unidom-category)
[![Dependency Status](https://gemnasium.com/badges/github.com/topbitdu/unidom-category.svg)](https://gemnasium.com/github.com/topbitdu/unidom-category)

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
include Unidom::Category::Concerns::AsCategory
include Unidom::Category::Concerns::AsAncestorCategory
include Unidom::Category::Concerns::AsDescendantCategory
```

### As Category concern

The As Category concern do the following tasks for the includer automatically:
1. Define the has_many :categorizings macro as: ``has_many :categorizings, class_name: 'Category::Categorizing'``
2. Define the #categorize! method as: ``categorize!(categorized, at: Time.now, primary: true)``
3. Define the #categorize? method as: ``categorize?(categorized, at: Time.now, primary: true)``

### As Categorized concern

The As Categorized concern do the following tasks for the includer automatically:
1. Define the has_many :categorizings macro as: ``has_many :categorizings, class_name: 'Unidom::Category::Categorizing', as: :categorized``
2. Define the has_many :categories macro as: ``has_many :categories, through: :categorizings, source: :category``
3. Define the #is_categorized! method as: ``is_categorized!(into: nil, at: Time.now, primary: true)``
4. Define the #is_categorized? method as: ``is_categorized?(into: nil, at: Time.now, primary: true)``

### As Ancestor Category concern

The As Ancestor Category concern do the following tasks for the includer automatically:
1. Define the has_many :descendant_category_rollups macro as: ``has_many :descendant_category_rollups, class_name: 'Unidom::Category::CategoryRollup', foreign_key: :ancestor_category_id, source: :ancestor_category``
2. Define the has_many :descendant_categories macro as: ``has_many :descendant_categories, class_name: 'Unidom::Category::Category', through: :descendant_category_rollups``
3. Define the #roll_up! method as: ``roll_up!(it, at: Time.now, primary: true)``
4. Define the #roll_up? method as: ``roll_up?(it, at: Time.now, primary: true)``

### As Descendant Category concern

The As Descendant Category concern do the following tasks for the includer automatically:
1. Define the has_many :ancestor_category_rollups macro as: ``has_many :ancestor_category_rollups, class_name: 'Unidom::Category::CategoryRollup', foreign_key: :descendant_category_id, source: :descendant_category``
2. Define the has_many :ancestor_categories macro as: ``has_many :ancestor_categories, class_name: 'Unidom::Category::Category', through: :ancestor_category_rollups``
3. Define the #is_rolled_up! as: ``is_rolled_up!(it, at: Time.now, primary: true)``
4. Define the #is_rolled_up? as: ``is_rolled_up?(it, at: Time.now, primary: true)``



## Disable the Model & Migration

If you only need the app components other than models, the migrations should be neglected, and the models should not be loaded.
```ruby
# config/initializers/unidom.rb
Unidom::Common.configure do |options|

  options[:neglected_namespaces] = %w{
    Unidom::Category
  }

end
```



## RSpec examples

### RSpec example manifest (run automatically)

```ruby
# spec/models/unidom_spec.rb
require 'unidom/category/models_rspec'

# spec/types/unidom_spec.rb
require 'unidom/category/types_rspec'

# spec/validators/unidom_spec.rb
require 'unidom/category/validators_rspec'
```

### RSpec shared examples (to be integrated)

```ruby
# spec/support/unidom_rspec_shared_examples.rb
require 'unidom/category/rspec_shared_examples'

# spec/models/unidom/category/categorizing_spec.rb
describe Unidom::Category::Categorizing, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {}

    categorized = Unidom::Product::Product.create! name: 'Model X', abbreviation: 'MX', packing_norm: 'car', measurement_unit: 'car', opened_at: Time.now

    tesla    = Unidom::Party::Company.create!           name:   'Tesla'
    scheme   = Unidom::Category::CategoryScheme.create! owner:  tesla,  name: 'eCar'
    category = Unidom::Category::Category.create!       scheme: scheme, name: 'Battery-powered vehicles'

    it_behaves_like 'Unidom::Category::Categorizing', model_attributes, categorized, category

  end

end
```
