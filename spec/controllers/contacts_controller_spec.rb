require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

  let(:contact) { Fabricate(:contact) }

  describe 'GET #index' do
    it 'populates an array of contacts' do
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

    it 'renders the :new view' do
      get :new
      
      expect(response).to render_template(:new)
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

      it 'create a new contact with custom fields' do
        contact_custom_attributes = Fabricate.attributes_for(:contact_custom_fields)
        
        expect {
          post :create, contact: contact_custom_attributes
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

  describe 'GET #edit' do
    it 'assigns the requested contact to @contact' do
      get :edit, id: contact

      expect(assigns(:contact)).to eq contact
    end

    it 'renders the :edit view' do
      get :edit, id: contact

      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT #update' do
    context 'valid attributes' do
      it 'located the requested @contact' do
        put :update, id: contact, contact: Fabricate.attributes_for(:contact)

        expect(assigns(:contact)).to eq contact
      end

      it 'changes contact attributes' do
        put :update, id: contact, contact: Fabricate.attributes_for(:contact, name: "Maria")
        contact.reload

        expect(contact.name).to eq "Maria"
      end

      it 'redirects to the updated contact' do
        put :update, id: contact, contact: Fabricate.attributes_for(:contact)

        expect(response).to redirect_to contact
      end
    end

    context 'invalid attributes' do 
      it 'not change contact attributes' do
        put :update, id: contact, contact: Fabricate.attributes_for(:contact, email: nil)
        
        contact.reload
        expect(contact.email).to eq "jhonlocke@gmail.com"
      end
    end
  end


  describe 'GET #show' do
    it 'assigns the requested contact to @contact' do
      get :show, id: contact

      expect(assigns(:contact)).to eq contact
    end
  end
end
