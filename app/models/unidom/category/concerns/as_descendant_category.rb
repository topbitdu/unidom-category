module Unidom::Category::Concerns::AsDescendantCategory

  extend ActiveSupport::Concern

  included do |includer|

    has_many :ancestor_category_rollups, class_name: 'Unidom::Category::CategoryRollup', foreign_key: :descendant_category_id, source: :descendant_category
    has_many :ancestor_categories,       class_name: 'Unidom::Category::Category',       through:     :ancestor_category_rollups

    def is_rolled_up!(it, at: Time.now, primary: true)
      rollup = ancestor_category_rollups.ancestor_category_is(it).valid_at(now: at).alive.first_or_create! elemental: primary, opened_at: at
      rollup.elemental = primary if rollup.elemental!=primary
      rollup.save!
      rollup
    end

    #def is_rolled_up?(it, at: Time.now, primary: true)
    #  ancestor_category_rollups.ancestor_category_is(it).primary(primary).valid_at(now: at).alive.exists?
    #end

  end

  module ClassMethods
  end

end
