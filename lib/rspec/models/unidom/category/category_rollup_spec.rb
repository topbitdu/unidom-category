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

  end

end
