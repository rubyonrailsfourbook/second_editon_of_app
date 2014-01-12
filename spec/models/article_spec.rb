require 'spec_helper'

describe Article do
  before(:each) do
    @tag = Tag.create(name: "Content")
    @article = Article.create(name: "Ruby on Rails Book Four", content: "This is Content" * 140)
    @tagging = Tagging.create(tag_id: @tag.id, article_id: @article.id)
  end

  subject { @article }

  it { should be_valid }
  it { should respond_to(:name) }
  it { should respond_to(:content) }
  it { should respond_to(:tags) }

  describe "is not vaild without a title" do
    before { @article.name = " "}
    it { should_not be_valid }
  end

  describe "is  nit vaild without content" do
    before { @article.content = " " }
    it { should_not be_valid }
  end

  describe "should return tags as a comma sperated string" do
    its(:tag_list) { should eql @tag.name }
  end
  describe "should set tag names" do
    before do 
      @article = Article.new(name: "Release 1.0", content: "This is some smaple content. " * 140) 
      @article.tag_list = @tag_list
      @article.save
      @tag_list = "Content,Post,Release"
    end
    #its(:tag_list) { should eql @tag_list}
  end
end
