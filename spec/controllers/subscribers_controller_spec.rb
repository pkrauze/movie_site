require 'rails_helper'

RSpec.describe SubscribersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #subscribe" do
    it "returns http success" do
      get :subscribe
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #unsubscribe" do
    it "returns http success" do
      get :unsubscribe
      expect(response).to have_http_status(:success)
    end
  end

end
