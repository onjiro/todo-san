class User < ActiveRecord::Base
  def self.find_or_create_from_auth_hash(auth_hash)
    User.find_by_provider_and_identifier_on_provider(auth_hash["provider"], auth_hash["uid"]) ||
      User.create_with_omniauth(auth_hash)
  end

  def self.create_with_omniauth(auth_hash)
    create! do |user|
      user.provider = auth_hash["provider"]
      user.identifier_on_provider = auth_hash["uid"]

      user.name = (user.provider == "twitter") ? auth_hash["info"]["nickname"]: auth_hash["info"]["name"]
    end
  end
end
