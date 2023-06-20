class Storyline < ApplicationRecord
    has_many :talks
    mount_uploader :image, ImageUploader
    belongs_to :user,optional: true
end
