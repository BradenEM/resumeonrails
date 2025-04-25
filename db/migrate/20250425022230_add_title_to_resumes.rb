class AddTitleToResumes < ActiveRecord::Migration[8.0]
  def change
    add_column :resumes, :title, :string
  end
end
