class User < ApplicationRecord
    has_many :posts
    has_many :favorites
    has_many :favorite_posts, through: :favorites, source: :post

    def self.find_or_create_from_auth(auth)
        provider = auth[:provider]
        uid = auth[:uid]
        user_name = auth[:info][:name]
        image_url = auth[:info][:image]
    
        self.find_or_create_by(provider: provider, uid: uid) do |user|
          user.user_name = user_name
          user.image_url = image_url
        end
      end
end
