require 'spec_helper'

describe "PostPages" do
  # before(:each) {
  #   @post = FactoryGirl.create(:post)
  # }
  # before(:each) {
  #   @post = Post.new(:title => 'This is a title', :content => 'This is some content')
  # }
  
  describe "GET /post" do
    it "should have content 'Posts#index'" do
      visit '/posts'
      posts = Post.all
      posts.each do |post|
        page.should have_content(post.title)
        page.should have_content(post.content)
      end
    end
  end
  
  describe "new" do
    # let(:post) = { FactoryGirl.create(:post) }
    
    it "should have content 'Posts#new'" do
      post = Post.new(:title => 'This is a title', :content => 'This is some content')
      visit '/posts/new'
      page.should have_content('Posts#new')
      page.should have_content('Title')
      page.should have_content('Content')
      
      fill_in 'post_title', :with => post.title
      fill_in 'post_content', :with => post.content
      
      expect {
        click_button 'Create Post'
      }.to change { Post.count }.by(1)
      
      # save_page
      # page.current_path should == post_path(@post)

      
    end
  end
  
  describe "edit" do
    
    it "should have edit post" do
      post = FactoryGirl.create(:post)
      visit post_path(post)
      page.should have_content('Edit')
      # page.current_path should == post_path(@post)
      click_link 'Edit'
      
      page.current_path should == edit_post_path(post)
    end
  end
  
  describe "destroy", :js => true do
    it "should delete a post" do
      post = FactoryGirl.create(:post)
      visit post_path(post)
      page.should have_content("Delete")
      
      expect {
        click_link 'Delete'
        page.driver.browser.switch_to.alert.accept
      }.to change { Post.count }.by(-1)
    end
  end
end
