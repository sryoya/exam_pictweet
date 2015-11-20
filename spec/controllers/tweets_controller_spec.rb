require 'rails_helper'
describe TweetsController do

  describe 'GET #index' do
    before :each do
      get :index
    end

    it 'renders the :index template' do
      expect(response).to render_template :index
    end

    it "populates an array of tweets ordered by created_at DESC" do
      tweets = create_list(:tweet, 3)
      get :index
      expect(assigns(:tweets)).to match(tweets.sort{ |a, b| b.created_at <=> a.created_at } )
    end
  end

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before :each do
      @tweet = create(:tweet)
      get :edit, id: @tweet
    end

    it "assigns the requested contact to @tweet" do
      expect(assigns(:tweet)).to eq @tweet
    end

    it "renders the :edit template" do
      expect(response).to render_template :edit
    end
  end

  describe 'post #create' do
    describe 'ログイン' do
      login_user
      it 'renders the :create template' do
        post :create, tweet: attributes_for(:tweet)
        expect(response).to render_template :create
      end

      it "save success" do
  expect {
    post :create, tweet: attributes_for(:tweet)
  }.to change(Tweet, :count).by(1)
end
    end
  end

  describe 'delete #destroy' do
    describe 'ログイン' do
      login_user
      it 'renders the :create template' do
        tweet = create(:tweet)
        delete :destroy, id: tweet
        expect(response).to render_template :destroy
      end

      it 'destroy the tweets' do
        tweet = create(:tweet)
        expect{
          delete :destroy, id: tweet
        }.to change(Tweet, :count).by(0)
      end
    end
  end

  describe 'patch #update' do
    describe 'ログイン' do
      login_user
      before :each do
        @tweet = create(:tweet)
        patch :update, id: @tweet, tweet: attributes_for(:tweet, text: "hello")
      end

      it 'renders the :patch template' do
        expect(response).to render_template :update
      end

      it "changes tweet's attributes" do
        @tweet.reload
        expect(@tweet.text).to eq ("hello")
      end
    end
  end

end