describe Unidom::Category::CategoryRollup, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      ancestor_category_id:   SecureRandom.uuid,
      descendant_category_id: SecureRandom.uuid
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    category_attributes = {
      scheme_id:    SecureRandom.uuid,
      code:         'XC',
      name:         'Top Category',
      abbreviation: 'TopCat'
    }

    it_behaves_like 'belongs_to', model_attributes, :ancestor_category,   Unidom::Category::Category, category_attributes
    it_behaves_like 'belongs_to', model_attributes, :descendant_category, Unidom::Category::Category, category_attributes

    it_behaves_like 'monomorphic scope', model_attributes, :ancestor_category_is,   :ancestor_category
    it_behaves_like 'monomorphic scope', model_attributes, :descendant_category_is, :descendant_category

    it   = Unidom::Category::Category.create! category_attributes.merge(code: 'ZC', name: 'Sub Category', abbreviation: 'SubCat')
    into = Unidom::Category::Category.create! category_attributes.merge(code: 'YC')

    it_behaves_like 'assert_present!', described_class, :roll_up!, [ it, { into: into, at: Time.now } ], [ { 0 => :it }, :into, :at ]

  end

end
