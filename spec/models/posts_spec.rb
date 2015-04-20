require 'rails_helper'

describe Post do
  it { should validate_presence_of (:title) }
  it { should validate_presence_of (:body) }

  describe "#to_param" do
    post = Post.create.tap do |p|
      p.title = "Hello"
      p.body = "World"
      p.save
    end

    it "parameterizes based on id and title" do
      expect(post.to_param).to eq "#{post.id}-#{post.title.downcase}"
    end
  end
end
