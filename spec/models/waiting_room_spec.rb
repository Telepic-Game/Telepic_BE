require 'rails_helper'

RSpec.describe WaitingRoom, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:room_code) }
  end
end
