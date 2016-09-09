# Categorizing 是分类（category）和被分类项（categorized）之间的关联关系。

class Unidom::Category::Categorizing < ActiveRecord::Base

  self.table_name = 'unidom_categorizings'

  include Unidom::Common::Concerns::ModelExtension

  belongs_to :category,    class_name:  'Unidom::Category::Category'
  belongs_to :categorized, polymorphic: true

  scope :category_is,    ->(category)    { where category_id: to_id(category) }
  scope :categorized_is, ->(categorized) { where categorized: categorized     }

  #def self.categorize!(category, categorized, opened_at = Time.now)
  #  self.categorized_is(categorized).category_is(category).valid_at.alive.first_or_create! elemental: true, opened_at: opened_at
  #end

  def self.categorize!(categorized, into: nil, at: Time.now)
    categorized_is(categorized).category_is(into).valid_at.alive.first_or_create! elemental: true, opened_at: at
  end

end
