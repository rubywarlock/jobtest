class CreateThirdPages < ActiveRecord::Migration
  def change
    create_table :third_pages do |t|
      t.integer :second_page_id
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
