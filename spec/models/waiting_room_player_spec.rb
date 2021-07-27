require 'rails_helper'

RSpec.describe WaitingRoomPlayer, type: :model do
  describe 'Relationships' do
    it { should belong_to :player }
    it { should belong_to :waiting_room }
  end
end
