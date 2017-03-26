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

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates text', model_attributes, :name,
      length: 2..described_class.columns_hash['name'].limit
    it_behaves_like 'validates text', model_attributes, :abbreviation,
      length: 2..described_class.columns_hash['abbreviation'].limit

    scheme_attributes = {
      owner_id:   SecureRandom.uuid,
      owner_type: 'Unidom::Category::Owner::Mock',
      name:       'Scheme #1'
    }

    it_behaves_like 'belongs_to', model_attributes, :scheme, Unidom::Category::CategoryScheme, scheme_attributes

    it_behaves_like 'monomorphic scope', model_attributes, :scheme_is, :scheme

    it_behaves_like 'scope', :code_length_is, [
      { attributes_collection: [ model_attributes                    ], count_diff: 0, args: [ 1 ] },
      { attributes_collection: [ model_attributes                    ], count_diff: 1, args: [ 2 ] },
      { attributes_collection: [ model_attributes                    ], count_diff: 0, args: [ 3 ] },
      { attributes_collection: [ model_attributes.merge(code: 'XCX') ], count_diff: 0, args: [ 2 ] },
      { attributes_collection: [ model_attributes.merge(code: 'XCX') ], count_diff: 1, args: [ 3 ] },
      { attributes_collection: [ model_attributes.merge(code: 'XCX') ], count_diff: 0, args: [ 4 ] }
    ]

    it_behaves_like 'scope', :code_starting_with, [
      { attributes_collection: [ model_attributes                   ], count_diff: 0, args: [ 'C' ] },
      { attributes_collection: [ model_attributes                   ], count_diff: 1, args: [ 'X' ] },
      { attributes_collection: [ model_attributes                   ], count_diff: 0, args: [ 'A' ] },
      { attributes_collection: [ model_attributes.merge(code: 'CX') ], count_diff: 1, args: [ 'C' ] },
      { attributes_collection: [ model_attributes.merge(code: 'CX') ], count_diff: 0, args: [ 'X' ] },
      { attributes_collection: [ model_attributes.merge(code: 'CX') ], count_diff: 0, args: [ 'A' ] }
    ]

  end

end
