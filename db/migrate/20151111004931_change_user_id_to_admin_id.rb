class ChangeUserIdToAdminId < ActiveRecord::Migration
  def change
    rename_column :answers, :user_id, :admin_id
  end
end
