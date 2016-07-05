require 'rails_helper'

RSpec.describe PublishesController, type: :controller do

  #*******************************************************************************
  describe "GET #index" do
    subject { get :index }

    it "renders the index template" do
      expect(subject).to render_template(:index)
    end
  end
#*******************************************************************************
  describe "GET #show" do
    publish = FactoryGirl.create(:publish)
    subject { get :show, :id => publish.to_param }

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
  publish = FactoryGirl.create(:publish)
    subject { get :edit, :id => publish.id.to_param }

    it "render the edit template" do
      expect(subject).to render_template(:edit)
    end
  end
#*******************************************************************************
  describe "POST #create" do
    let(:publish) { FactoryGirl.build(:publish) }
    let(:params) do
        {
            publish: {
                name: publish.name
            }
        }
    end

    before do
        post :create, params
    end

    it "redirects_to :action => :show" do
      expect(response).to redirect_to :action => :show,
                                     :id => assigns(:publish).id
    end

  end
#*******************************************************************************
  let(:publish) { FactoryGirl.create(:publish) }
#*******************************************************************************
  describe "PUT update" do
    let(:expected_publish) {  assigns(:publish) }
    let(:params) do
        {
            id: publish.id,
            publish: {
                name: publish.name
            }
        }
    end

    before do
        put :update, params
    end

    it 'redirects to book detail page' do
      expect(response).to redirect_to(publish_path(publish))
    end

    it 'assigns correct variables' do
      expect(expected_publish).to eq publish
    end
end
#*******************************************************************************
  describe "DELETE #destroy" do
    let(:params) do
      {
        :id => publish.to_param
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
