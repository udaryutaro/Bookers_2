class RemoveProfilleImageIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :profille_image_id, :string
  end
end
