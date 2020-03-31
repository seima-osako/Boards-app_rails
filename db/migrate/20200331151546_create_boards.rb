class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :title
      t.text :body

      # created_atとupdated_atが作成される
      t.timestamps
    end
  end
end
