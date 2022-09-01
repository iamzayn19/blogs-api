require 'rails_helper'

RSpec.describe BlogLike, type: :model do
  describe "Validations" do
    subject { described_class.new(blog_id: 13, user_id: 3).save }
    
    it "is valid with valid attributes" do
      expect(subject).to eq(false)
    end
  end 

  describe "Associations" do
    it { should belong_to(:user)}
    it { should belong_to(:blog) }
  end
end
