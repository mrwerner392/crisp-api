class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.belongs_to :review, null: false, foreign_key: true
      t.belongs_to :restaurant, null: false, foreign_key: true
      t.string :url
      t.string :caption

      t.timestamps
    end
  end
end
