class LoginSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :password
end
