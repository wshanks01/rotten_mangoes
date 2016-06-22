class MoviesController < ApplicationController
  def index
    search_title = params[:title]
    search_director = params[:director]
    @movies = Movie.all
    if params[:title] || params[:director] || params[:length]
      if params[:title].present?
        @movies = @movies.where(['title LIKE ?', "%#{search_title}"])
      end

      if params[:director].present?
        @movies = @movies.where(['director LIKE ?', "%#{search_director}"])
      end

      if params[:length] == 1.to_s
        @movies = @movies.where('runtime_in_minutes < 90')
      elsif params[:length] == 2.to_s
        @movies = @movies.where('runtime_in_minutes >= 90 OR runtime_in_minutes < 120')
      else 
        @movies = @movies.where('runtime_in_minutes >= 120')
      end
    end
  end


  #   @movies = Movie.all
  #   @movie_search = Movie.search({ :title => params[:title], :directo})
  #   if params[:title] && !params[:title].empty?
  #     @movie_search = Movie.search_title(params[:title]).all
  #   elsif params[:director]
  #     @movie_search = Movie.search_director(params[:director]).all
  #   else
  #     case params[:length].to_i
  #     when 1
  #       then @movie_search = Movie.short_movie
  #     when 2
  #       then @movie_search = Movie.medium_movie
  #     when 3
  #       then @movie_search = Movie.long_movie
  #     end
  #   end
  # end
 
  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description, :image
      )
  end
end

