class Post < ApplicationRecord
    belongs_to :user
    has_many :favorites
    mount_uploader :image, ImageUploader

    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

    def self.search(search)
        if search
          Post.where(['place LIKE ?', "%#{search}%"])
        else
          Post.all
        end
      end
end
