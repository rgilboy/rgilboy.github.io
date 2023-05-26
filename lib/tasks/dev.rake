desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do

  25.times do 
    user = User.new
    user.username = Faker::Name.first_name 
    user.password = "password"
    user.save
  end

  25.times do 
    skill = Skill.new
    skill.user_id = rand(25) 
    skill.skill_name = Faker::Sports::Football.position
    skill.skill_description = Faker::Quote.famous_last_words

  end

  25.times do 
    lesson = Lesson.new
    lesson.content = Faker::Quote.famous_last_words 
    lesson.skill_id = rand(25)
    
  end

end
