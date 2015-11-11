class ChangeAdminIdToUserAdminId < ActiveRecord::Migration
  def change
    rename_column :answers, :admin_id, :user_admin_id
  end
end
