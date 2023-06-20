class Storyline < ApplicationRecord
    has_many :talks, dependent: :destroy
    has_many :talkrooms, dependent: :destroy
    has_many :users, through: :talkrooms
    mount_uploader :image, ImageUploader
end
