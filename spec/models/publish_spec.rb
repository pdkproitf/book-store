require 'rails_helper'

RSpec.describe Publish, type: :model do
  before(:all) do
    @publish = FactoryGirl.create(:publish)
  end
  subject{ @publish }

  describe "validate " do
    it { expect(@publish).to be_valid }
    it { expect(@publish.name).to be_truthy }
    it { expect(@publish.name.size).to be <= 50 }
    it { expect(@publish).to validate_uniqueness_of(:name) }
  end

  describe "association" do
    it { is_expected.to have_many(:books) }
  end
end
