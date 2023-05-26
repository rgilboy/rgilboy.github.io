class SkillsController < ApplicationController

  def my_skills

    @user = User.where(:id => session.fetch(:user_id)).first

    matching_skills = @user.skills

    @list_of_skills = matching_skills.order({ :created_at => :desc })

    render({:template => "/skills/user_skills.html.erb"})

  end

  def index
    matching_skills = Skill.all

    @list_of_skills = matching_skills.order({ :created_at => :desc })

    render({ :template => "skills/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_skills = Skill.where({ :id => the_id })

    @the_skill = matching_skills.at(0)

    matching_lessons = @the_skill.lessons

    @list_of_lessons = matching_lessons.order({ :created_at => :asc })

    render({ :template => "skills/show.html.erb" })
  end

  def create
    user_id = session.fetch(:user_id)

    the_skill = Skill.new
    the_skill.user_id = user_id
    the_skill.skill_name = params.fetch("query_skill_name")
    the_skill.skill_description = params.fetch("query_skill_description")

    if the_skill.valid?
      the_skill.save
      redirect_to("/skills/#{the_skill.id}", { :notice => "Skill created successfully." })
    else
      redirect_to("/skills", { :alert => the_skill.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_skill = Skill.where({ :id => the_id }).at(0)

    the_skill.user_id = params.fetch("query_user_id")
    the_skill.skill_name = params.fetch("query_skill_name")
    the_skill.skill_description = params.fetch("query_skill_description")

    if the_skill.valid?
      the_skill.save
      redirect_to("/skills/#{the_skill.id}", { :notice => "Skill updated successfully."} )
    else
      redirect_to("/skills/#{the_skill.id}", { :alert => the_skill.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_skill = Skill.where({ :id => the_id }).at(0)

    the_skill.destroy

    redirect_to("/skills", { :notice => "Skill deleted successfully."} )
  end
end
