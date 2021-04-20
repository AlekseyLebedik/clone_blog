class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title , :author
      t.text :description  

      t.boolean :to_publish 
      t.timestamps
    end
  end
end
