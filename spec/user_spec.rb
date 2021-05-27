require 'rails_helper'
RSpec.describe User do
  describe 'associations' do
    it 'should have many posts' do
      expect { should belong_to(:posts) }
    end
  end
  describe 'associations' do
    it 'should have many comments' do
      expect { should belong_to(:comments) }
    end
  end
  describe 'associations' do
    it 'should have many likes' do
      expect { should belong_to(:likes) }
    end
  end
  describe 'associations' do
    it 'should have many confirmed_friendships' do
      expect { should belong_to(:confirmed_friendships) }
    end
  end
  describe 'associations' do
    it 'should have many friends' do
      expect { should belong_to(:friends) }
    end
  end
  describe 'associations' do
    it 'should have many pending_friendships' do
      expect { should belong_to(:pending_friendships) }
    end
  end
  describe 'associations' do
    it 'should have many pending_friends' do
      expect { should belong_to(:pending_friends) }
    end
  end
  describe 'associations' do
    it 'should have many inverse_friendships' do
      expect { should belong_to(:inverse_friendships) }
    end
  end
  describe 'associations' do
    it 'should have many friend_requests' do
      expect { should belong_to(:friend_requests) }
    end
  end
end
