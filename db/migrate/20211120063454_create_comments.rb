class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :text
      
      t.belongs_to :user
      t.belongs_to :workout

      t.timestamps
    end
  end
end
