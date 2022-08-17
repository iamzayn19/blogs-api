require 'rails_helper'

RSpec.describe Blog, type: :model do
  describe "Validations" do
    subject { described_class.new(title: "Anything", body: "Lorem ipsum", status: 3, user_id: 3) }
    
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is invalid without a title" do
      subject.title = nil
      expect(subject).to be_valid
    end

    it "is invalid without a body" do
      subject.body = nil
      expect(subject).to be_valid
    end

    it "is invalid without a status" do
      subject.status = nil
      expect(subject).to be_valid
    end

    it "is invalid without a user" do
      subject.user_id = nil
      expect(subject).to be_valid
    end
  end 

  describe "Associations" do
    it { should belong_to(:user)}
    it { should have_many(:comments) }
    it { should have_many(:blog_likes) }
  end
end
