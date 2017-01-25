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

  end

end
