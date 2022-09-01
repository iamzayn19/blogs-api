require 'rails_helper'

RSpec.describe Blog, type: :model do
  describe "Validations" do
 
    it "is valid with valid attributes" do
      subject = Blog.new(title: "Anything", body: "Lorem ipsum", status: 3, user_id: 3).save
      expect(subject).to eq(false)
    end

    it "is invalid without a title" do
      subject = Blog.new(title: nil, body: "Lorem ipsum", status: 3, user_id: 3).save
      expect(subject).to eq(false)
    end

    it "is invalid without a body" do
      subject = Blog.new(title: "Anything", body: nil, status: 3, user_id: 3).save
      expect(subject).to eq(false)
    end
    
    it "is invalid without a status" do
      subject = Blog.new(title: "Anything", body: "Lorem ipsum", status: nil, user_id: 3).save
      expect(subject).to eq(false)
    end

    it "is invalid without a user" do
      subject = Blog.new(title: "Anything", body: "Lorem ipsum", status: 3, user_id: nil).save
      expect(subject).to eq(false)
    end
  end 

  describe "Associations" do
    it { should belong_to(:user)}
    it { should have_many(:comments) }
    it { should have_many(:blog_likes) }
  end
end
