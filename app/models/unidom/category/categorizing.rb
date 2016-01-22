# Categorizing 是分类（category）和被分类项（categorized）之间的关联关系。

class Unidom::Category::Categorizing < ::ActiveRecord::Base

  self.table_name = 'unidom_categorizings'

  belongs_to :category,    class_name:  'Unidom::Category::Category'
  belongs_to :categorized, polymorphic: true

  scope :category_is,    ->(category)    { where category_id: (category.respond_to?(:id) ? category.id : category) }
  scope :categorized_is, ->(categorized) { where categorized: categorized }

  include ::Unidom::Common::Concerns::ModelExtension

end
