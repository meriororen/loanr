class ChangeAmountTypeToDecimals < ActiveRecord::Migration
  def up
    change_column :loans, :amount, :decimal, :precision => 8, :scale => 2
  end

  def down
  end
end
