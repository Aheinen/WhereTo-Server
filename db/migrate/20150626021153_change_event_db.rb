class ChangeEventDb < ActiveRecord::Migration
  def change
    change_column :events, :start_time, 'datetime USING CAST(start_time AS datetime)'
  end
end
