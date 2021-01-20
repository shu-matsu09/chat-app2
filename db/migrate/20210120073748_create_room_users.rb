class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      # 別テーブルのカラムを参照する「外部キー」という型を使用する際はreferences型を用いる
      # その際、foreign_key: trueという制約を設けることで他テーブルの情報を参照できる
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.timestamps
    end
  end
end