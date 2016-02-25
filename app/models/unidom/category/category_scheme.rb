# Category Scheme 是分类体系。
# 所有者（owner）可以是系统（System）、标准（Standard）、或者某个参与者（Party，如：Person、Shop、Company）。

class Unidom::Category::CategoryScheme < ::ActiveRecord::Base

  self.table_name = 'unidom_category_schemes'

  belongs_to :owner,      polymorphic: true
  has_many   :categories, class_name: 'Unidom::Category::Category', foreign_key: :scheme_id

  validates :name, presence: true, length: { in: 2..self.columns_hash['name'].limit }

  scope :owned_by, ->(owner) { where owner: owner }

  include Unidom::Common::Concerns::ModelExtension

end
