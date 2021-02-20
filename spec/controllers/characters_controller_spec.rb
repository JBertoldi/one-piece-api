require 'rails_helper'

RSpec.describe Api::V1::CharactersController, type: :controller do
  describe 'GET #index' do
    before do
      create(:luffy)
      create(:zoro)
    end

    before do
      get :index
    end

    it 'returns http success' do
      expect(response).to have_http_status(200)
    end

    it 'has two characters' do
      expect(json_body.length).to eq(2)
    end

    it 'JSON body response contains expected characters and attributes' do
      expect(json_body[0].keys).to match_array(%i[id japanese_name english_name bounty status epithet pirate_crew devil_fruit])
    end
  end

  describe 'GET #show' do
    let(:luffy) { create(:luffy) }

    it 'returns http success' do
      get :show, params: { id: luffy.id }
      expect(response).to have_http_status(200)
    end

    it 'returns data of an single student' do
      get :show, params: { id: luffy.id }
      expect(json_body.length).to be(1)
    end

    it 'returns an error if the student does not exist' do
      get :show, params: { id: 300_000 }
      expect(response).to be_not_found
    end
  end
end
