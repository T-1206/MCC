class Talk < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user,optional: true
    belongs_to :storyline,optional: true

end
