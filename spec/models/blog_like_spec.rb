require 'rails_helper'

RSpec.describe BlogLike, type: :model do
  describe "Validations" do
    subject { described_class.new(user_id: 3, blog_id: 13) }
    
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  end 

  describe "Associations" do
    it { should belong_to(:user)}
    it { should belong_to(:blog) }
  end
end
