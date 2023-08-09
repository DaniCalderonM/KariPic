class Kpcomment < ApplicationRecord
  belongs_to :kpuser
  belongs_to :kppost
end
