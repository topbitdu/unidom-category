module Unidom::Category::Concerns::AsCategorized

  extend ActiveSupport::Concern

  self.included do |includer|

    has_many :categorizings, class_name: 'Unidom::Category::Categorizing', as:     :categorized
    has_many :categories,    through:    :categorizings,                   source: :category

  end

end
