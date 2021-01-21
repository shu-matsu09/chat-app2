class Room < ApplicationRecord
  # dependentオプションに:destroyを指定すると、親モデルが削除された時、それに紐付いている子モデルも一緒に削除される
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :messages, dependent: :destroy

  validates :name, presence: true
end
