# Category 是分类。

class Unidom::Category::Category < ActiveRecord::Base

  self.table_name = 'unidom_categories'

  validates :name,         presence:    true, length: { in: 2..self.columns_hash['name'].length         }
  validates :abbreviation, allow_blank: true, length: { in: 2..self.columns_hash['abbreviation'].length }

  belongs_to :scheme, class_name: 'Unidom::Category::CategoryScheme', foreign_key: :scheme_id

  has_many :ancestor_category_rollups, class_name: 'Unidom::Category::CategoryRollup', foreign_key: :descendant_category_id, source: :descendant_category
  has_many :ancestor_categories,       class_name: 'Unidom::Category::Category',       through:     :ancestor_category_rollups

  has_many :descendant_category_rollups, class_name: 'Unidom::Category::CategoryRollup', foreign_key: :ancestor_category_id, source: :ancestor_category
  has_many :descendant_categories,       class_name: 'Unidom::Category::Category',       through:     :descendant_category_rollups

  has_many :categorizings, class_name: 'Category::Categorizing'

  scope :scheme_is,          ->(scheme) { where scheme_id: (scheme.respond_to?(:id) ? scheme.id : scheme )    }
  scope :code_length_is,     ->(length) { where 'LENGTH(code) = :code_length',  code_length:       length     }
  scope :code_starting_with, ->(prefix) { where 'code LIKE :prefix_expression', prefix_expression: prefix+'%' }

end
