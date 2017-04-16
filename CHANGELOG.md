# Unidom Category Change Log 类别领域模型引擎变更日志

## v0.1
1. Category Scheme model & migration (20000301000000)
2. Category model & migration (20000302000000)
3. Category Rollup model & migration (20000303000000)
4. Categorizing model & migration (20000304000000)

## v0.2
1. Improved the Categorizing model to add the .``categorize!`` method
2. Improved the Category model for the validation
3. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v0.9

## v0.3
1. Improved the Category Rollup model to add the .``roll_up!`` method

## v1.0
1. Improved the Categorizing model & the Category Rollup model to support the Keyword Arguments
2. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.0

## v1.1
1. As Categorized concern
2. Improved the Category model to add the #``categorize!`` method

## v1.2
1. As Category concern
2. Improved the Category model to include the As Category concern
3. Improved the As Categorized concern to add the #``is_categorized!`` method & the #``is_categorized?`` method

## v1.3
1. As Ancestor Category concern
2. As Descendant Category concern
3. Improved the Category model to include the As Ancestor Category concern & the As Descendant Category concern

## v1.4
1. Improved the As Ancestor Category concern to add the #``roll_up!`` method
2. Improved the As Descendant Category concern to add the #``is_rolled_up!`` method

## v1.5
1. Improved the As Ancestor Category concern to add the #``roll_up?`` method
2. Improved the As Descendant Category concern to add the #``is_rolled_up?`` method

## v1.5.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.6

## v1.5.2
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7

## v1.5.3
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7.1

## v1.5.4
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.8
2. Improved the Engine class to include the Engine Extension

## v1.5.5
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.9
2. Improved the models to support the namespace neglecting

## v1.6
1. Models RSpec examples manifest
2. Types RSpec examples manifest
3. Validators RSpec examples manifest

## v1.6.1
1. Improved the Category Scheme spec for the validations on the #name attribute
2. Improved the Category spec for the validations on the #name attribute, & the #abbreviation attribute

## v1.6.2
1. Improved the Category Scheme spec for the ``has_many :categories, class_name: 'Unidom::Category::Category', foreign_key: :scheme_id`` macro
2. Improve the Category spec for the ``belongs_to :scheme, class_name: 'Unidom::Category::CategoryScheme', foreign_key: :scheme_id`` macro

## v1.6.3
1. Improve the Category spec for the scheme_is scope, the code_length_is scope, & the code_starting_with scope

## v1.6.4
1. Improve the Categorizing spec for the ``belongs_to :category, class_name: 'Unidom::Category::Category'`` macro
2. Improve the Category Rollup spec for the ``belongs_to :ancestor_category, class_name: 'Unidom::Category::Category'`` macro, & the ``belongs_to :descendant_category, class_name: 'Unidom::Category::Category'`` macro

## v1.6.5
1. Improve the Category Rollup model for the ancestor_category_is scope, & the descendant_category_is scope
2. Improve the Category Rollup spec for the ancestor_category_is scope, & the descendant_category_is scope
3. Improve the Categorizing spec for the category_is scope

## v1.6.6
1. Improve the Category Scheme spec for the validations on the #name attribute
2. Improve the Category spec for the validations on the #name attribute, & the #abbreviation attribute

## v1.6.7
1. Improve the Categorizing model for the argument validations of the .categorize! method
2. Categorizing shared examples
3. RSpec shared examples manifest

## v1.6.8
1. Improve the Category Rollup model for the argument validations of the .roll_up! method
2. Improve the Category Rollup spec for the argument validations of the .roll_up! method
