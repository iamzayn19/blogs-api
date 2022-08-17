require 'rails_helper'

RSpec.describe Blog, type: :model do
  describe 'Validations' do
    subject {
    described_class.new(title: "Anything",
                        body: "Lorem ipsum",
                        status: 3,
                        user_id: 3)
                      }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  end 
end
