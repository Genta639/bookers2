class RenameIntroductioinColumnToIntroduction2 < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :introductioin, :introduction
  end
end
