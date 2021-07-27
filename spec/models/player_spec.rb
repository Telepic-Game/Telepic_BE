require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'Relationships' do
    it { should have_many :player_games }
    it { should have_many(:games).through(:player_games) }
    it { should have_one :stack }
    it { should have_many(:cards).through(:stack) }
  end
  describe 'Validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
end
