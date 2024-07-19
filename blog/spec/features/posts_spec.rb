# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  before do
    driven_by(:rack_test)
  end

  feature 'index' do
    scenario 'visits the index' do
      visit posts_url
      expect(page).to have_css('h1', text: 'Posts')
    end
  end

  feature 'create' do
    given(:post) { build(:post) }
    scenario 'creates a post' do
      visit posts_url
      click_on 'New post'

      fill_in 'Content', with: post.content
      fill_in 'Name', with: post.name
      fill_in 'Title', with: post.title
      click_on 'Create Post'

      expect(page).to have_text('Post was successfully created')
    end
  end

  feature 'update' do
    given(:post) { create(:post) }
    scenario 'updates a post' do
      visit post_url(post)
      click_on 'Edit this post', match: :first

      fill_in 'Content', with: 'New content'
      fill_in 'Name', with: 'New name'
      fill_in 'Title', with: 'New title'
      click_on 'Update Post'

      expect(page).to have_text('Post was successfully updated')
    end
  end

  feature 'destroy' do
    given(:post) { create(:post) }

    scenario 'destroys a post' do
      visit post_url(post)
      click_on 'Destroy this post', match: :first

      expect(page).to have_text('Post was successfully destroyed')
    end
  end
end
