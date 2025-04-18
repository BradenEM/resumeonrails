class CreateResumes < ActiveRecord::Migration[8.0]
  def change
    create_table :resumes do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :summary

      t.timestamps
    end
  end
end
