class FixTimeColumn < ActiveRecord::Migration
  def change
    rename_column :reservations, :time, :time_slot
  end
end
