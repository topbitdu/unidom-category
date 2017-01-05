##
# Category 是分类。

class Unidom::Category::Category < Unidom::Category::ApplicationRecord

  self.table_name = 'unidom_categories'

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::Category::Concerns::AsCategory
  include Unidom::Category::Concerns::AsAncestorCategory
  include Unidom::Category::Concerns::AsDescendantCategory

  validates :name,         presence:    true, length: { in: 2..self.columns_hash['name'].limit         }
  validates :abbreviation, allow_blank: true, length: { in: 2..self.columns_hash['abbreviation'].limit }

  belongs_to :scheme, class_name: 'Unidom::Category::CategoryScheme', foreign_key: :scheme_id

  scope :scheme_is,          ->(scheme) { where scheme_id: (scheme.respond_to?(:id) ? scheme.id : scheme )    }
  scope :code_length_is,     ->(length) { where 'LENGTH(code) = :code_length',  code_length:       length     }
  scope :code_starting_with, ->(prefix) { where 'code LIKE :prefix_expression', prefix_expression: prefix+'%' }

end
