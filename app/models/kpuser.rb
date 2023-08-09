class Kpuser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :kpposts
         has_many :kpcomments
         has_one_attached :avatar
         enum :role, [:normal_kpuser, :author]
end
