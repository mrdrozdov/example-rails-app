class Comment < ApplicationRecord
  include Visible

  validates :user_id, presence: true

  belongs_to :article
end
