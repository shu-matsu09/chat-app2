class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  # 以下のメソッドによって各レコードとファイルを1対1の関係で紐づける
  # :ファイル名の記述により、モデル.ファイル名で添付されたファイルにアクセスできる
  # また、このファイル名は、そのモデルが紐付いたフォームから送られるパラメーターのキーにもなる
  has_one_attached :image

  # unlessオプションにメソッド名を指定することで、「メソッドの返り血がfalseならばバリデーションによる検証を行う」という条件を作っている
  validates :content, presence: true, unless: :was_attached?

  # 以下は、画像があればtrue、なければfalseを返すメソッド
  # レコードにファイルが添付されているかどうかでtrue,falseを返すattached?メソッドを使用
  def was_attached?
    self.image.attached?
  end
end
