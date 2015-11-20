require 'rails_helper'
describe UsersController do
  describe 'ログイン' do
  login_user
    describe 'GET #show' do
      before :each do
        @user = create(:user)
        get :show, id: @user
      end
     it "assigns the requested user to @nickname" do
          expect(assigns(:nickname)).to eq @user.nickname
      end

      it "renders the :show template" do
          expect(response).to render_template :show
      end

      it "populates an array of user's @tweets ordered by created_at DESC" do
        tweets = create_list(:tweet, 3)
        expect(assigns(:tweets)).to match(@user.tweets.sort{ |a, b| b.created_at <=> a.created_at } )
      end

      it "populates @tweets_count is the number of the user's tweets" do
        tweets = create_list(:tweet, 3)
        expect(assigns(:tweets_count)).to eq @user.tweets.count
      end
    end
  end

end