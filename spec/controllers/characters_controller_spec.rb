require 'rails_helper'

RSpec.describe Api::V1::CharactersController, type: :controller do
  describe 'GET #index' do
    before do
      create(:character)
    end
    before do
      get :index
    end

    it 'returns http success' do
      expect(response).to have_http_status(200)
    end

    it 'JSON body response contains expected characters and attributes' do
      json_response = JSON.parse(response.body, symbolize_names: true)
      expect(json_response[0].keys).to match_array(%i[id japanese_name bounty english_name epithet pirate_crew devil_fruit])
    end
  end

  describe 'GET #show' do
    let(:character) { create(:character) }

    it 'returns http success' do
      get :show, params: { id: character.id }
      expect(response).to have_http_status(200)
    end

    it 'returns data of an single student' do
      get :show, params: { id: character.id }
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to be(1)
    end

    it 'returns an error if the student does not exist' do
      get :show, params: { id: 300_000 }
      expect(response).to be_not_found
    end
  end
end
