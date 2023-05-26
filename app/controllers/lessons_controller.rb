class LessonsController < ApplicationController
  def index
    matching_lessons = Lesson.all

    @list_of_lessons = matching_lessons.order({ :created_at => :desc })

    render({ :template => "lessons/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_lessons = Lesson.where({ :id => the_id })

    @the_lesson = matching_lessons.at(0)

    render({ :template => "lessons/show.html.erb" })
  end

  def create
    the_lesson = Lesson.new
    the_lesson.content = params.fetch("query_content")
    the_lesson.skill_id = params.fetch("query_skill_id")

    if the_lesson.valid?
      the_lesson.save
      redirect_to("/skills/#{the_lesson.skill_id}", { :notice => "Lesson created successfully." })
    else
      redirect_to("/skills/#{the_lesson.skill_id}", { :alert => the_lesson.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_lesson = Lesson.where({ :id => the_id }).at(0)

    the_lesson.content = params.fetch("query_content")
    the_lesson.skill_id = params.fetch("query_skill_id")

    if the_lesson.valid?
      the_lesson.save
      redirect_to("/lessons/#{the_lesson.id}", { :notice => "Lesson updated successfully."} )
    else
      redirect_to("/lessons/#{the_lesson.id}", { :alert => the_lesson.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_lesson = Lesson.where({ :id => the_id }).at(0)

    skill_id = the_lesson.skill_id

    the_lesson.destroy

    redirect_to("/skills/#{skill_id}", { :notice => "Lesson deleted successfully."} )
  end
end
