class AddFriendshipToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :friendship_id, :integer
  end
end
