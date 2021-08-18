require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'Relationships' do
    it { should have_many :player_games }
    it { should have_many(:players).through(:player_games) }
    it { should have_many(:stacks).through(:players) }
    it { should have_many(:cards).through(:stacks) }
  end
  describe 'Validations' do
    it { should validate_presence_of(:turn_counter) }
    # it { should validate_presence_of(:active) }
  end
end
