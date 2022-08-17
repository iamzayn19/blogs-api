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
  end 
end
