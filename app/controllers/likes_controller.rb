class LikesController < ApplicationController
  def index

    if session.fetch(:user_id)
    @current_user = User.where(:id => session.fetch(:user_id)).at(0)
    matching_likes = Like.all.where(:fan => @current_user.id)

    @list_of_likes = matching_likes.order({ :created_at => :desc })

    render({ :template => "likes/index.html.erb" })

    else
      redirect_to("/", {:alert => "Please sign in to view your likes"})

    end
    
  end

  def show
    the_id = params.fetch("path_id")

    matching_likes = Like.where({ :id => the_id })

    @the_like = matching_likes.at(0)

    render({ :template => "likes/show.html.erb" })
  end

  def create
    the_like = Like.new
    the_like.fan = session.fetch(:user_id)
    the_like.skill = params.fetch("query_skill_id")

    if the_like.valid?
      the_like.save
      redirect_to("/skills/#{the_like.skill}", { :notice => "Like created successfully." })
    else
      redirect_to("/skills/#{the_like.skill}", { :alert => the_like.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_like = Like.where({ :id => the_id }).at(0)

    the_like.fan = params.fetch("query_fan")
    the_like.skill = params.fetch("query_skill")

    if the_like.valid?
      the_like.save
      redirect_to("/likes/#{the_like.id}", { :notice => "Like updated successfully."} )
    else
      redirect_to("/likes/#{the_like.id}", { :alert => the_like.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("query_like_id")
    the_like = Like.where({ :id => the_id }).at(0)

    the_skill = the_like.skill

    the_like.destroy

    redirect_to("/skills/#{the_like.skill}", { :notice => "Like deleted successfully."} )
  end
end
