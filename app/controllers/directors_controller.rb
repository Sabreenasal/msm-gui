class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end

  def create
    create_new_director = Director.new
    create_new_director.name = params.fetch("the_name")
    create_new_director.dob = params.fetch("the_dob")
    create_new_director.bio = params.fetch("the_bio")
    create_new_director.image = params.fetch("the_image")

      create_new_director.save
      
   redirect_to("/directors")
    
  end

  def destroy
    the_id = params.fetch("path_id")
    matching_directors = Director.where({ :id => the_id })

    the_director = matching_directors.at(0)
    the_director.destroy
    redirect_to("/directors")
  end

  def update
    the_id = params.fetch("path_id")
    
    finding_directors = Director.where({ :id => the_id })
    update_director = finding_directors.at(0)

    update_director.name = params.fetch("the_name")
    update_director.dob = params.fetch("the_dob")
    update_director.bio = params.fetch("the_bio")
    update_director.image = params.fetch("the_image")

    update_director.save
    
      redirect_to("/directors/#{update_director.id}")
  end
end
