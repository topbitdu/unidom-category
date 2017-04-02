shared_examples 'Unidom::Category::Categorizing' do |model_attributes, categorized, category|

  before :each do
  end

  after :each do
  end

  context do

    it_behaves_like 'assert_present!', described_class, :categorize!, [ categorized, { into: category, at: Time.now } ], [ { 0 => :categorized }, :into, :at ]

  end

end
