require 'spec_helper'

describe Post do
  it "should create a new post" do
    post = Post.new
    post.should_not be_valid
  end

  it "should not be valid without a title" do
    post = Post.new(content: "This is some content")
    post.should_not be_valid
  end

  it "should not be valid without content" do
    post = Post.new(title: "This is some title")
    post.should_not be_valid
  end

  it "should change the number of Posts" do
    post = Post.new(title: "This is title", content: "This is some content")
    expect { post.save }.to change { Post.count }.by(1)
  end

  it "raises an error with a title" do
    post = Post.new
    expect { post.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
  end

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  
end
