class CreateBikes < ActiveRecord::Migration[7.0]
  def change
    create_table :bikes do |t|
      t.integer :user_id
      t.string :name
      t.string :category
      t.integer :cc

      t.timestamps
    end
  end
end
