class RemoveProfilleImageFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :profille_image, :string
  end
end
