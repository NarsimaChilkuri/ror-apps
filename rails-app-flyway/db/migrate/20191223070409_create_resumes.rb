class CreateResumes < ActiveRecord::Migration[5.1]
  def change
    create_table :resumes do |t|
      t.integer :post_id	
      t.string :name
      t.string :attachment

      t.timestamps
    end
  end
end
