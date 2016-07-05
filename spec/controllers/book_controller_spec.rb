require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  #*******************************************************************************
  describe "GET #index" do
    subject { get :index }

    it "renders the index template" do
      expect(subject).to render_template(:index)
    end
  end
#*******************************************************************************
  describe "GET #show" do
    book = FactoryGirl.create(:book)
    subject { get :show, :id => book.to_param }

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
  book = FactoryGirl.create(:book)
    subject { get :edit, :id => book.id.to_param }

    it "render the edit template" do
      expect(subject).to render_template(:edit)
    end
  end
#*******************************************************************************
  describe "POST #create" do
    let(:book) { FactoryGirl.build(:book) }
    let(:params) do
        {
            book: {
                category_id: book.category_id,
                title: book.title,
                author: book.author,
                publish_id: book.publish_id,
                cost: book.cost,
                sale: book.sale,
                photo: book.photo,
                content: book.content,
                weight: book.weight,
                size: book.size,
                pages: book.pages,
                date: book.date
            }
        }
    end

    before do
        post :create, params
    end

    it "redirects_to :action => :show" do
      expect(response).to redirect_to :action => :show,
                                     :id => assigns(:book).id
    end

  end
#*******************************************************************************
  let(:book) { FactoryGirl.create(:book) }
#*******************************************************************************
  describe "PUT update" do
    let(:expected_book) {  assigns(:book) }
    let(:params) do
        {
            id: book.id,
            book: {
                category_id: book.category_id,
                title: book.title,
                author: book.author,
                publish_id: book.publish_id,
                cost: book.cost,
                sale: book.sale,
                photo: book.photo,
                content: book.content,
                weight: book.weight,
                size: book.size,
                pages: book.pages,
                date: book.date
            }
        }
    end

    before do
        put :update, params
    end

    it 'redirects to book detail page' do
      expect(response).to redirect_to(book_path(book))
    end

    it 'assigns correct variables' do
      expect(expected_book).to eq book
    end
end
#*******************************************************************************
  describe "DELETE #destroy" do
    let(:params) do
      {
        :id => book.to_param
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
