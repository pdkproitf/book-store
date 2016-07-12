require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:all) do
    @category = FactoryGirl.create(:category)
  end
  subject{ @category }

  describe "validate " do
    it { expect(@category).to be_valid }
    it { expect(@category.name).to be_truthy }
    it { expect(@category.name.size).to be <= 50 }
    it { expect(@category).to validate_uniqueness_of(:name) }
  end

  describe "association" do
    it { expect(@category).to have_many(:books) }
  end

end
