class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :company, null: false, foreign_key: true
      t.references :company_user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
