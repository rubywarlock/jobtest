class CreateSecondPages < ActiveRecord::Migration
  def change
    create_table :second_pages do |t|
      t.integer :first_page_id
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
