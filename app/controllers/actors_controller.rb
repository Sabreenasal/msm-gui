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
 def update
  
   the_id = params.fetch("path_id")

   matching_actors = Actor.where({ :id => the_id })
   update_actors = matching_actors.at(0)

   update_actors.name = params.fetch("the_name")
   update_actors.dob = params.fetch("the_dob")
   update_actors.bio = params.fetch("the_bio")
   update_actors.image = params.fetch("the_image")

   update_actors.save

   redirect_to("/actors/#{update_actors.id}")
 end
  
    def destroy
      the_id = params.fetch("path_id")
  
      matching_movies = Actor.where({ :id => the_id })
      the_actor = matching_movies.at(0)
      the_actor.destroy
      redirect_to("/actors")
    end
  
end
