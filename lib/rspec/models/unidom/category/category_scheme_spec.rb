describe Unidom::Category::CategoryScheme, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      owner_id:   SecureRandom.uuid,
      owner_type: 'Unidom::Category::Owner::Mock',
      name:       'Scheme #1'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
