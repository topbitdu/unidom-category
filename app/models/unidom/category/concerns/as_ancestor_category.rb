module Unidom::Category::Concerns::AsAncestorCategory

  extend ActiveSupport::Concern

  included do |includer|

    has_many :descendant_category_rollups, class_name: 'Unidom::Category::CategoryRollup', foreign_key: :ancestor_category_id, source: :ancestor_category
    has_many :descendant_categories,       class_name: 'Unidom::Category::Category',       through:     :descendant_category_rollups

  end

  module ClassMethods
  end

end
