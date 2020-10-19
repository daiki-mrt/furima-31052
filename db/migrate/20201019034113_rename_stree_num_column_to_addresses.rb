class RenameStreeNumColumnToAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :stree_num, :street_num
  end
end
