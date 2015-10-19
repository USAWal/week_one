require 'rails_helper'

RSpec.describe MainController, type: :controller do

  it { is_expected.to route(:get, '/').to action: :index }

  describe "GET #index" do
    before(:each) { get :index }

    it { is_expected.to respond_with 200 }
    it { is_expected.to render_template 'index' }
  end

end
