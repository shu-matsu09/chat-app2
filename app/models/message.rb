class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  # 以下のメソッドによって各レコードとファイルを1対1の関係で紐づける
  # :ファイル名の記述により、モデル.ファイル名で添付されたファイルにアクセスできる
  # また、このファイル名は、そのモデルが紐付いたフォームから送られるパラメーターのキーにもなる
  has_one_attached :image

  validates :content, presence: true
end
