# Category 是分类。

class Unidom::Category::Category < ActiveRecord::Base

  self.table_name = 'unidom_categories'

  validates :name,         presence: true, length: { in: 2..self.columns_hash['name'].length         }
  validates :abbreviation, presence: true, length: { in: 2..self.columns_hash['abbreviation'].length }

  belongs_to :scheme, class_name: 'Unidom::Category::CategoryScheme', foreign_key: :scheme_id

  scope :scheme_is, ->(scheme) { where scheme_id: (scheme.respond_to?(:id) ? scheme.id : scheme ) }

end
