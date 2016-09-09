module Unidom::Category::Concerns::AsCategorized

  extend ActiveSupport::Concern

  included do |includer|

    has_many :categorizings, class_name: 'Unidom::Category::Categorizing', as:     :categorized
    has_many :categories,    through:    :categorizings,                   source: :category

    def is_categorized!(into: nil, at: Time.now, primary: true)

      raise ArgumentError('The into argument is required.') if into.blank?
      raise ArgumentError('The at argument is required.'  ) if at.blank?

      categorizings.category_is(into).valid_at(now: at).alive.first_or_create! elemental: primary, opened_at: at

    end

    def is_categorized?(into: nil, at: Time.now, primary: true)

      raise ArgumentError('The into argument is required.') if into.blank?
      raise ArgumentError('The at argument is required.'  ) if at.blank?

      categorizings.category_is(into).valid_at(now: at).alive.primary(primary).exists?

    end

  end

end
