class User < ApplicationRecord
    has_many :posts
    has_many :favorites
    has_many :favorite_posts, through: :favorites, source: :post
    has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
    has_many :followings, through: :active_relationships, source: :follower
    has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
    has_many :followers, through: :passive_relationships, source: :following

    def followed_by?(user)
      passive_relationships.find_by(following_id: user.id).present?
    end

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
