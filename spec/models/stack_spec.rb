require 'rails_helper'

RSpec.describe Stack, type: :model do
  describe 'Relationships' do
    it { should have_many :user_games }
    it { should have_many :cards }
  end
  describe 'Validations' do
  end
end
