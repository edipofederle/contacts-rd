require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe 'GET #index' do
    it 'populates an array of contacts' do
      contact = Fabricate(:contact)

      get :index
      expect(assigns(:contacts)).to eq ([contact])
    end

    it 'renders the :index view' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'assigns new contactt' do
      get :new
      expect(assigns(:contact)).to be_kind_of(Contact)
    end
  end

  describe 'POST #create' do
    context 'valid attributes' do
      let(:contact_attributes) { Fabricate.attributes_for(:contact) }

      it 'creates a new contact' do
        expect {
          post :create, contact: contact_attributes
        }.to change(Contact, :count).by(1)
      end

      it 'redirects to the new contact' do
        post :create, contact: contact_attributes
        expect(response).to redirect_to Contact.last
      end
    end

    context 'invalid attributes' do
      let(:contact_invalid_attributes) { Fabricate.attributes_for(:contact_invalid) }

      it 'not save the new contact' do
        expect {
          post :create, contact: contact_invalid_attributes
        }.to_not change(Contact, :count)
      end

      it 're-renders the new action' do
        post :create, contact: contact_invalid_attributes

        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do
    it 'assigns the requested contact to @contact' do
      contact = Fabricate(:contact)

      get :show, id: contact
      expect(assigns(:contact)).to eq contact
    end
  end
end
