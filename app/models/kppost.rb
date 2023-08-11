class Kppost < ApplicationRecord
  belongs_to :kpuser
  has_many :kpcomments
  has_many_attached :kpimages
end
