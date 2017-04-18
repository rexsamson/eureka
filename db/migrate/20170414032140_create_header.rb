class CreateHeader < ActiveRecord::Migration[5.0]
  def change
    create_table :headers do |t|
      t.string :title
      t.string :header
      t.text :content
      t.string :footer
      t.string :note
    end
  end
end
