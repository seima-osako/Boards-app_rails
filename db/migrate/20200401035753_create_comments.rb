class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      # 特定のboardと紐付けるためのidを生成
      t.references :board, foreign_key: true
      t.string :name, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
