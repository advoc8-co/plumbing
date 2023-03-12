class CreateProjectStakeholders < ActiveRecord::Migration[7.0]
  def change
    create_table :project_stakeholders do |t|
      t.references :project, null: false, foreign_key: true
      t.references :stakeholder, null: false, foreign_key: true

      t.timestamps
    end
  end
end
