class Article < ApplicationRecord

    validates :title, :author, :description, presence: true
    mount_uploader :avatar , ImageUploader
end
