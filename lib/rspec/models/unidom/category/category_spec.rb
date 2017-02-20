describe Unidom::Category::Category, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      scheme_id:    SecureRandom.uuid,
      code:         'XC',
      name:         'Top Category',
      abbreviation: 'TopCat'
    }

    name_max_length         = described_class.columns_hash['name'].limit
    abbreviation_max_length = described_class.columns_hash['abbreviation'].limit

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

    it_behaves_like 'validates', model_attributes, :abbreviation,
      {                     } => 0,
      { abbreviation: nil   } => 0,
      { abbreviation: ''    } => 0,
      { abbreviation: '1'   } => 1,
      { abbreviation: 'A'   } => 1,
      { abbreviation: '11'  } => 0,
      { abbreviation: 'AA'  } => 0,
      { abbreviation: '111' } => 0,
      { abbreviation: 'AAA' } => 0,
      { abbreviation: '1'*(abbreviation_max_length-1) } => 0,
      { abbreviation: 'A'*(abbreviation_max_length-1) } => 0,
      { abbreviation: '1'*abbreviation_max_length     } => 0,
      { abbreviation: 'A'*abbreviation_max_length     } => 0,
      { abbreviation: '1'*(abbreviation_max_length+1) } => 1,
      { abbreviation: 'A'*(abbreviation_max_length+1) } => 1

  end

end
