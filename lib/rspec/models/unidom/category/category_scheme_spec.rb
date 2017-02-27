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

    name_max_length = described_class.columns_hash['name'].limit

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates', model_attributes, :name,
      {             } => 0,
      { name: nil   } => 2,
      { name: ''    } => 2,
      { name: '1'   } => 1,
      { name: 'A'   } => 1,
      { name: '11'  } => 0,
      { name: 'AA'  } => 0,
      { name: '111' } => 0,
      { name: 'AAA' } => 0,
      { name: '1'*(name_max_length-1) } => 0,
      { name: 'A'*(name_max_length-1) } => 0,
      { name: '1'*name_max_length     } => 0,
      { name: 'A'*name_max_length     } => 0,
      { name: '1'*(name_max_length+1) } => 1,
      { name: 'A'*(name_max_length+1) } => 1

    category_1_attributes = {
      code:         'XC1',
      name:         'Top Category #1',
      abbreviation: 'TopCat-2'
    }

    category_2_attributes = {
      code:         'XC2',
      name:         'Top Category #2',
      abbreviation: 'TopCat-2'
    }

    it_behaves_like 'has_many', model_attributes, :categories, Unidom::Category::Category, [ category_1_attributes, category_2_attributes ]

  end

end
