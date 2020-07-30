class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email,:jti 
  has_many :travels
end

