class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def create
     create_new_actor = Actor.new

     create_new_actor.name = params.fetch("the_name")
     create_new_actor.dob = params.fetch("the_dob")
     create_new_actor.bio = params.fetch("the_bio")
     create_new_actor.image = params.fetch("the_image")

     create_new_actor.save
 
     redirect_to("/actors")
  end
end
