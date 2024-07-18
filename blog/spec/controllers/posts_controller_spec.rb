# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:post_attributes) { attributes_for(:post) }

    it 'creates a new post' do
      expect do
        post :create, params: { post: post_attributes }
      end.to change(Post, :count).by(1)
    end

    it 'redirects to the created post' do
      post :create, params: { post: post_attributes }
      expect(response).to redirect_to(Post.last)
    end
  end

  describe 'GET #show' do
    let(:post) { create(:post) }

    it 'returns a success response' do
      get :show, params: { id: post.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    let(:post) { create(:post) }

    it 'returns a success response' do
      get :edit, params: { id: post.id }
      expect(response).to be_successful
    end
  end

  describe 'PATCH #update' do
    let(:post) { create(:post) }
    let(:new_attributes) { { title: 'New Title' } }

    it 'updates the requested post' do
      patch :update, params: { id: post.id, post: new_attributes }
      post.reload
      expect(post.title).to eq('New Title')
    end

    it 'redirects to the post' do
      patch :update, params: { id: post.id, post: new_attributes }
      expect(response).to redirect_to(post)
    end
  end

  describe 'DELETE #destroy' do
    let!(:post) { create(:post) }

    it 'destroys the requested post' do
      expect do
        delete :destroy, params: { id: post.id }
      end.to change(Post, :count).by(-1)
    end

    it 'redirects to the posts list' do
      delete :destroy, params: { id: post.id }
      expect(response).to redirect_to(posts_url)
    end
  end
end
