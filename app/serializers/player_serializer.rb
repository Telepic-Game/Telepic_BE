class PlayerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :player_stories, :permissions
end
