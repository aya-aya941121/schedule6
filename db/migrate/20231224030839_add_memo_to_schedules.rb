class AddMemoToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :memo, :string
  end
  def up
    add_column :schedules, :memo, :string
  end

  def down
    remove_column :schedules, :memo
  end
end
