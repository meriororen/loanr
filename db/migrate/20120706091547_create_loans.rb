class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.string :from
      t.string :amount

      t.timestamps
    end
  end
end
