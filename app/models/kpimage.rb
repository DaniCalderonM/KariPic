class Kpimage < ApplicationRecord
  belongs_to :kpimageable, polymorphic: true
end
