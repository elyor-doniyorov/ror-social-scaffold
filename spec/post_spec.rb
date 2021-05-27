require 'rails_helper'
RSpec.describe Post do
  describe 'associations' do
    it 'should belongs to user' do
      expect { should belong_to(:user) }
    end
  end
  describe 'associations' do
    it 'should have many comments' do
      expect { should have_many(:comments) }
    end
  end
  describe 'associations' do
    it 'should have many likes' do
      expect { should have_many(:likes) }
    end
  end
end
