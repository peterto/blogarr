require 'spec_helper'

describe "PostPages" do
  before(:each) {
    @post = FactoryGirl.create(:post)
  }
  
  describe "GET /post" do
    it "should have content 'Posts#index'" do
      visit '/posts'
      page.should have_content('Posts#index')
    end
  end
  
  describe "new" do
    # let(:post) = { FactoryGirl.create(:post) }
    
    it "should have content 'Posts#new'" do
      
      visit '/posts/new'
      page.should have_content('Posts#new')
      page.should have_content('Title')
      page.should have_content('Content')
      
      fill_in 'post_title', :with => @post.title
      fill_in 'post_content', :with => @post.content
      
      expect {
        click_button 'Create Post'
      }.to change { Post.count }.by(1)
      
      # save_page
      # page.current_path should == post_path(@post)

      
    end
  end
  
  describe "edit" do
    it "should have edit post" do
      
      visit post_path(@post)
      page.should have_content('Edit')
      # page.current_path should == post_path(@post)
      click_link 'Edit'
      
      page.current_path should == edit_post_path(@post)
    end
  end
end
