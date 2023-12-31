require 'rails_helper'

RSpec.describe CharmsController, type: :controller do
  include Support::RequestHelpers

  describe 'GET #index' do
    it 'returns a successful response' do
      create_list(:charm, 10)
      get :index
      expect(response).to be_successful
      expect(response_body.length).to eq(10)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      charm = create(:charm)
      get :show, params: { id: charm.id }
      expect(response).to be_successful
      expect(response_body['id']).to eq(charm.id)
    end
  end

  describe 'POST #create' do
    it 'returns a successful response' do
      charm_attributes = attributes_for(:charm)
      post :create, params: { charm: charm_attributes }
      expect(response).to be_successful
      expect(response_body['name']).to eq(charm_attributes[:name])
    end
  end

  describe 'PUT #update' do
    it 'returns a successful response' do
      charm = create(:charm)
      charm_attributes = attributes_for(:charm)
      put :update, params: { id: charm.id, charm: charm_attributes }
      expect(response).to be_successful
      expect(response_body['name']).to eq(charm_attributes[:name])
    end
  end

  describe 'DELETE #destroy' do
    it 'returns a successful response' do
      charm = create(:charm)
      delete :destroy, params: { id: charm.id }
      expect(response).to be_successful
      expect(Charm.count).to eq(0)
    end
  end
end
