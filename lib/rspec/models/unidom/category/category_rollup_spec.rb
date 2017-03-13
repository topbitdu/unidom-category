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

  end

end
