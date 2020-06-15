class Tweet < ApplicationRecord

	mount_uploader :attachment, AttachmentUploader
	has_many :tweet_tags, dependent: :destroy
	has_many :tags, through: :tweet_tags
	validates :body, presence: true
    has_many :likes, dependent: :destroy

	belongs_to :user
end
