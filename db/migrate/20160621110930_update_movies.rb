class UpdateMovies < ActiveRecord::Migration
  def change
    remove_column :reviews, :movies_id
    add_column :reviews, :movie_id, :integer
  end
end
