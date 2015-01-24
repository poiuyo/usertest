class RenameFarmersTableToUsers < ActiveRecord::Migration
  def change
    rename_table :farmers,:users
  end
end
