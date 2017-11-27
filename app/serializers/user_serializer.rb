class UserSerializer < ActiveModel::Serializer

  attributes :id, :email, :tokens, :uid, :provider
end  