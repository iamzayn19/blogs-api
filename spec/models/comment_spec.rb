require 'rails_helper'

RSpec.describe Comment, type: :model do
  

  describe "Associations" do
    it { should belong_to(:user)}
    it { should belong_to(:blog) }
  end

  describe "Validations" do
    subject { described_class.new(text: "Anything", user_id: 3, blog_id: 13) }
    
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is invalid without a text" do
      subject.text = nil
      expect(subject).to be_valid
    end
  end 
end
