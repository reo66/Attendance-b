class AddAdminToUsers < ActiveRecord::Migration[5.1]
  def change
    # userが管理権限を持つかをtrueかfalseで返すbooleanで判定。デフォルトをfalseに指定
    add_column :users, :admin, :boolean,default: false
  end
end
