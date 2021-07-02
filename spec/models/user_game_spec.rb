require 'rails_helper'

RSpec.describe UserGame, type: :model do
  describe 'Relationships' do
    it { should belong_to :game }
    it { should belong_to :user }
    it { should belong_to :stack }
  end
  describe 'Validations' do
    it { should validate_presence_of(:username) }
  end
end
