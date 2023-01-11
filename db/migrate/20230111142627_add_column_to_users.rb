class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :uid, :string, null: false
    add_column :users, :provider, :string, null: false, default: ""
    # uidとproviderの組み合わせを一意にする
    add_index :users, [:uid, :provider], unique: true
  end
end
