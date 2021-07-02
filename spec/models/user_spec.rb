require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Relationships' do
    it { should have_many :user_games }
    it { should have_many(:games).through(:user_games) }
    it { should have_many(:stacks).through(:user_games) }
  end
  describe 'Validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
end
