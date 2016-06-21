class UpdateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true, foreign_key: true
      t.references :movies, index: true, foreign_key: true
      t.text :text
      t.integer :rating_out_of_ten

      t.timestamps null: false
    end
  end
end
