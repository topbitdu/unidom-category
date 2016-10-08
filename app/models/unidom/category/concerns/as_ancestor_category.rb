module Unidom::Category::Concerns::AsAncestorCategory

  extend ActiveSupport::Concern

  included do |includer|

    has_many :descendant_category_rollups, class_name: 'Unidom::Category::CategoryRollup', foreign_key: :ancestor_category_id, source: :ancestor_category
    has_many :descendant_categories,       class_name: 'Unidom::Category::Category',       through:     :descendant_category_rollups

    def roll_up!(it, at: Time.now, primary: true)
      rollup = descendant_category_rollups.descendant_category_is(it).valid_at(now: at).alive.first_or_create! elemental: primary, opened_at: at
      rollup.elemental = primary if rollup.elemental!=primary
      rollup.save!
      rollup
    end

    #def roll_up?(it, at: Time.now, primary: true)
    #  descendant_category_rollups.descendant_category_is(it).primary(primary).valid_at(now: at).alive.exists?
    #end

  end

  module ClassMethods
  end

end
