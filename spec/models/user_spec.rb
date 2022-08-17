require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject {
    described_class.new(first_name: "Matt",
                        last_name: "Reeves",
                        email: "test@gmail.com",
                        password: "abcd1234")
                      }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a first_name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a last_name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end 
end
