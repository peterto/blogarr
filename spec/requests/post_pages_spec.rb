require 'spec_helper'

describe "PostPages" do
  before(:each) {
    @post = FactoryGirl.create(:post)
  }
  
  describe "GET /post_pages" do
    it "should have content 'Posts#index'" do
      visit '/posts'
      page.should have_content('Posts#index')
    end
  end
  
  describe "GET /post/new" do
    # let(:post) = { FactoryGirl.create(:post) }
    
    it "should have content 'Posts#new'" do
      
      visit '/posts/new'
      page.should have_content('Posts#new')
      page.should have_content('Title')
      page.should have_content('Content')
      
      fill_in 'post_title', :with => @post.title
      fill_in 'post_content', :with => @post.content
      
      click_button 'Create Post'
      
      # page.current_path should == post_path(@post)

      
    end
  end
end
