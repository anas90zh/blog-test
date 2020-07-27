class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :descrition
      t.datetime :created_at
      t.datetime :upldated_at
    end
  end
end
