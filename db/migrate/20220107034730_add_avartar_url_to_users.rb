class AddAvartarUrlToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :avatar_url, :string
  end
end
