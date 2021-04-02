class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :studytitle
      t.text :content
      t.integer :hour
      t.integer :minute
    end
  end
end
