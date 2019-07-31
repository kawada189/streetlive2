class Post < ApplicationRecord
    belongs_to :user
    has_many :favorites
    mount_uploader :image, ImageUploader

    validates :title, presence: true, length: { maximum: 50 }
    validates :contents, presence: true, length: { maximum: 140 }

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
