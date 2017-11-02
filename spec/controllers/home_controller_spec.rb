require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      login_with create( :user )
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'unauthorized user returns to login without success' do
      login_with nil
      get :index
      expect( response ).to redirect_to( new_user_session_path )
    end
  end
end