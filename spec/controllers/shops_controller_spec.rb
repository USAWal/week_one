require 'rails_helper'

RSpec.describe ShopsController, type: :controller do

  context 'there are some shops' do
    before(:each) { create_list :shop, 21 }
    describe "GET #index" do
      before(:each) { get :index, page: 2, per: 10 }
      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'assigns shops to paginated shops' do
        expect(assigns :shops).to eq Shop.page(2).per(10)
      end
    end
  end

end
