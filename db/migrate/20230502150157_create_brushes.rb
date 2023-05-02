class CreateBrushes < ActiveRecord::Migration[6.0]
  def change
    create_table :brushes do |t|
      t.integer :artstyle_id
      t.integer :program_id
      t.integer :user_id
      t.string :brush_name
      t.string :website_name

      t.timestamps
    end
  end
end
