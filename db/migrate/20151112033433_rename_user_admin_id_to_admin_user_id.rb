class RenameUserAdminIdToAdminUserId < ActiveRecord::Migration
  def change
    rename_column :answers, :user_admin_id, :admin_user_id
  end
end
