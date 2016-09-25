module Unidom::Category::Concerns::AsDescendantCategory

  extend ActiveSupport::Concern

  included do |includer|

    has_many :ancestor_category_rollups, class_name: 'Unidom::Category::CategoryRollup', foreign_key: :descendant_category_id, source: :descendant_category
    has_many :ancestor_categories,       class_name: 'Unidom::Category::Category',       through:     :ancestor_category_rollups

  end

  module ClassMethods
  end

end
