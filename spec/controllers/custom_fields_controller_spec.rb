require 'rails_helper'

RSpec.describe CustomFieldsController, type: :controller do

  login_user

  other_user = Fabricate(:user_locke)
  Fabricate(:custom_field, user: other_user)

  let!(:custom_field) { Fabricate(:custom_field, user: subject.current_user) }

  describe 'GET #index' do
    it 'populates an array of custom fields' do
      get :index

      expect(assigns(:fields)).to eq ([custom_field])
    end

    it 'renders the :index view' do
      get :index

      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'assigns new custom field' do
      get :new

      expect(assigns(:custom_field)).to be_kind_of(CustomField)
    end

    it 'renders the :new view' do
      get :new
      
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'valid attributes' do
      let(:custom_field_attributes) { Fabricate.attributes_for(:custom_field) }

      it 'creates a new custom field' do
        expect {
          post :create, custom_field: custom_field_attributes
        }.to change(CustomField, :count).by(1)
      end

      it 'belongs to current_user' do
        post :create, custom_field: custom_field_attributes

        expect(CustomField.last.user).to eq subject.current_user
      end

      it 'redirects to the :index view' do
        post :create, custom_field: custom_field_attributes

        expect(response).to redirect_to :custom_fields
      end
    end

    context 'invalid attributes' do
      let(:custom_field_invalid_attributes) { Fabricate.attributes_for(:custom_field_invalid) }

      it 'not save the new custom field' do
        expect {
          post :create, custom_field: custom_field_invalid_attributes
        }.to_not change(CustomField, :count)
      end

      it 're-renders the new action' do
        post :create, custom_field: custom_field_invalid_attributes

        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE destory' do
    it 'deletes the custom_field' do
      expect {
        delete :destroy, id: custom_field
      }.to change(CustomField, :count).by(-1)
    end
  end

end
