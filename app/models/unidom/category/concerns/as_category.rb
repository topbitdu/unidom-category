module Unidom::Category::Concerns::AsCategory

  extend ActiveSupport::Concern

  included do |includer|

    has_many :categorizings, class_name: 'Category::Categorizing'

    def categorize!(categorized, at: Time.now, primary: true)

      raise ArgumentError('The categorized argument is required.') if categorized.blank?
      raise ArgumentError('The at argument is required.'         ) if at.blank?

      categorizings.categorized_is(categorized).valid_at(now: at).alive.first_or_create! elemental: primary, opened_at: at

    end

    def categorize?(categorized, at: Time.now, primary: true)

      raise ArgumentError('The categorized argument is required.') if categorized.blank?
      raise ArgumentError('The at argument is required.'         ) if at.blank?

      categorizings.categorized_is(categorized).valid_at(now: at).alive.primary(primary).exists?

    end

  end

  module ClassMethods
  end

end
