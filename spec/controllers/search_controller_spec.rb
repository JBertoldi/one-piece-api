require 'rails_helper'

RSpec.describe Api::V1::SearchController, type: :controller do
  let(:luffy) { create(:luffy) }

  describe 'GET api/search/:text' do
    context 'with text = luffy' do
      before do
        get :index, params: { query: luffy.en_name.split.sample }
      end

      it 'returns http success' do
        expect(response).to have_http_status(200)
      end

      it "receives luffy's info" do
        expect(json_body[0][:searchable_id]).to eq luffy.id
      end
    end
  end
end
