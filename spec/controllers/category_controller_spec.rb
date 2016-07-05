require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  #*******************************************************************************
  describe "GET #index" do
    subject { get :index }

    it "renders the index template" do
      expect(subject).to render_template(:index)
    end
  end
#*******************************************************************************
  describe "GET #show" do
    category = FactoryGirl.create(:category)
    subject { get :show, :id => category.to_param }

    it "render the show template" do
      expect(subject).to render_template(:show)
    end
  end
#*******************************************************************************
  describe "GET #new" do
    subject { get :new }

    it "render the new template" do
      expect(subject).to render_template(:new)
    end
  end
#*******************************************************************************
  describe "GET #edit" do
  category = FactoryGirl.create(:category)
    subject { get :edit, :id => category.id.to_param }

    it "render the edit template" do
      expect(subject).to render_template(:edit)
    end
  end
#*******************************************************************************
  describe "POST #create" do
    let(:category) { FactoryGirl.build(:category) }
    let(:params) do
        {
            category: {
                name: category.name
            }
        }
    end

    before do
        post :create, params
    end

    it "redirects_to :action => :show" do
      expect(response).to redirect_to :action => :show,
                                     :id => assigns(:category).id
    end

  end
#*******************************************************************************
  let(:category) { FactoryGirl.create(:category) }
#*******************************************************************************
  describe "PUT update" do
    let(:expected_category) {  assigns(:category) }
    let(:params) do
        {
            id: category.id,
            category: {
                name: category.name
            }
        }
    end

    before do
        put :update, params
    end

    it 'redirects to book detail page' do
      expect(response).to redirect_to(category_path(category))
    end

    it 'assigns correct variables' do
      expect(expected_category).to eq category
    end
end
#*******************************************************************************
  describe "DELETE #destroy" do
    let(:params) do
      {
        :id => category.to_param
      }
    end
    before do
      delete :destroy, params
    end
    it "redirects_to :action => :index" do
      expect(subject).to redirect_to :action => :index
    end
  end
end
