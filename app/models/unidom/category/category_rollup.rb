# Category Rollup 是分类的层级关系。

class Unidom::Category::CategoryRollup < ::ActiveRecord::Base

  self.table_name = 'unidom_category_rollups'

  include Unidom::Common::Concerns::ModelExtension

  validates :distance, presence: true, numericality: { integer_only: true, greater_than: 0 }

  belongs_to :ancestor_category,   class_name: 'Unidom::Category::Category'
  belongs_to :descendant_category, class_name: 'Unidom::Category::Category'

  scope :apart, ->(distance = 1) { where distance: distance }

  scope :ancestor_category_is,   ->(category) { where ancestor_category_id:   (category.respond_to?(:id) ? category.id : category) }
  scope :descendant_category_is, ->(category) { where descendant_category_id: (category.respond_to?(:id) ? category.id : category) }

  after_create ->(record) {
    return unless 1==record.distance
    ancestor_category = record.ancestor_category_id
    ancestor_category_rollups_1 = self.class.descendant_category_is(record.ancestor_category_id).alive
    ancestor_category_rollups_1.each do |ancestor_category_rollup|
      self.class.apart(1+ancestor_category_rollup.distance).
        ancestor_category_is(ancestor_category_rollup.ancestor_category_id).
        descendant_category_is(record.descendant_category_id).
        first_or_create! elemental: ancestor_category_rollup.elemental, from_date: ancestor_category_rollup.from_date
    end
  }

end
