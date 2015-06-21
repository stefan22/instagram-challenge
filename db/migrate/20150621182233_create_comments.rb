class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :thoughts
      t.boolean :like

      t.timestamps null: false
    end
  end
end
