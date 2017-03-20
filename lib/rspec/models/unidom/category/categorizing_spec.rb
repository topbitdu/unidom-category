describe Unidom::Category::Categorizing, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      category_id:      SecureRandom.uuid,
      categorized_id:   SecureRandom.uuid,
      categorized_type: 'Unidom::Category::Categorized::Mock'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    category_attributes = {
      scheme_id:    SecureRandom.uuid,
      code:         'XC',
      name:         'Top Category',
      abbreviation: 'TopCat'
    }

    it_behaves_like 'belongs_to', model_attributes, :category, Unidom::Category::Category, category_attributes

    it_behaves_like 'monomorphic scope', model_attributes, :category_is, :category

  end

end
