require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'Relationships' do
    it { should have_many :user_games }
    it { should have_many(:users).through(:user_games) }
    it { should have_many(:stacks).through(:user_games) }
  end
  describe 'Validations' do
    it { should validate_presence_of(:active) }
    it { should validate_presence_of(:turn_counter) }
  end
end
