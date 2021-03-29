class AddTimecountToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments,
     :timecount, :integer
  end
end
