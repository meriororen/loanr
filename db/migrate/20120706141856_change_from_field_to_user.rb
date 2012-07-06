class ChangeFromFieldToUser < ActiveRecord::Migration
  def up
    remove_column :loans, :from
    add_column :loans, :borrower_id, :integer
    add_column :loans, :loaner_id, :integer
  end

  def down
  end
end
