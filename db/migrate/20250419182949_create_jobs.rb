class CreateJobs < ActiveRecord::Migration[8.0]
  def change
    create_table :jobs do |t|
      t.references :resume, null: false, foreign_key: true
      t.string :company
      t.string :location
      t.string :title
      t.text :summary

      t.timestamps
    end
  end
end
