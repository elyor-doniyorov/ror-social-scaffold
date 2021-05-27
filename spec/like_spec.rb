require 'rails_helper'
RSpec.describe Like do
  describe 'associations' do
    it 'should belongs to user' do
      expect { should belong_to(:user) }
    end
  end
  describe 'associations' do
    it 'should belongs to post' do
      expect { should belong_to(:post) }
    end
  end
end
