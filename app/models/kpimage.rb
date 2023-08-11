class Image < ApplicationRecord
  belongs_to :kpimageable, polymorphic: true
end
