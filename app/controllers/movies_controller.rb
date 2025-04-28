class MoviesController < ApplicationController
  def create
    m = Movie.new
    m.title = params.fetch("the_title")
    m.year = params.fetch("the_year")
    m.duration = params.fetch("the_duration")
    m.description = params.fetch("the_description")
    m.image = params.fetch("the_image")
    m.director_id = params.fetch("the_director_id")

    m.save

    redirect_to("/movies")
  end

  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create
    create_new_movie = Movie.new

    create_new_movie.title = params.fetch("the_title")
    create_new_movie.year = params.fetch("the_year")
    create_new_movie.duration = params.fetch("the_duration")
    create_new_movie.description = params.fetch("the_description")
    create_new_movie.image = params.fetch("the_image")
    create_new_movie.director_id = params.fetch("the_director_id")

    create_new_movie.save

    redirect_to("/movies")
  end

  def destroy
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    the_movie = matching_movies.at(0)
    the_movie.destroy
    redirect_to("/movies")
  end

  def update
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    update_movie = matching_movies.at(0)

    update_movie.title = params.fetch("the_title")
    update_movie.year = params.fetch("the_year")
    update_movie.duration = params.fetch("the_duration")
    update_movie.description = params.fetch("the_description")
    update_movie.image = params.fetch("the_image")
    update_movie.director_id = params.fetch("the_director_id")

    update_movie.save

    redirect_to("/movies/#{update_movie.id}")
  end
end
