class RemoveAvatarUrlfromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :avatar_url, :string
  end
end
