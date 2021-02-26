class Comment < ApplicationRecord
    validates :content, presence: true

    belongs_to :article, optional: true
end
