class CreateFirstPages < ActiveRecord::Migration
  def change
    create_table :first_pages do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
