require 'rails_helper'

RSpec.describe PlayerGame, type: :model do
  describe 'Relationships' do
    it { should belong_to :game }
    it { should belong_to :player }
  end
  describe 'Validations' do
    it { should validate_presence_of(:username) }
  end
end
