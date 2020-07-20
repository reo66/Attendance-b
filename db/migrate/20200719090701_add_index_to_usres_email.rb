# user modelのemailカラムにindexカラムを追加
class AddIndexToUsresEmail < ActiveRecord::Migration[5.1]
  def change
    # userテーブルのemailカラムにindexカラムを追加。一意性の検証有
    add_index :users, :email, unique: true
  end
end
