require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  describe "Validations" do
    
    it "is valid with valid attributes" do
      subject = Comment.new(text: "Anything", blog_id: 13, user_id: 3).save
      expect(subject).to eq(false)
    end

    it "is invalid without a text" do
      subject = Comment.new(text: nil, blog_id: 13, user_id: 3).save
      expect(subject).to eq(false)
    end
  end 

  describe "Associations" do
    it { should belong_to(:user)}
    it { should belong_to(:blog) }
  end
end
