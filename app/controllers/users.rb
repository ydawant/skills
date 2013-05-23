get '/users/new' do
  # render sign-up page
  @user = User.new
  erb :sign_up
end

post '/users' do
  # sign-up
  @user = User.new params[:user]
  if @user.save
    # successfully created new account; set up the session and redirect
    session[:user_id] = @user.id
    redirect '/'
  else
    # an error occurred, re-render the sign-up form, displaying errors
    erb :sign_up
  end
end

get '/users/skills' do
  @user = current_user
  erb :skills
end

post '/users/skills' do
p params.inspect
@user = current_user
@skill = Skill.create(:name => params[:skill], :context => params[:context])
params[:formal_education] == "true" ? @formal_education = true : @formal_education = false; 
@experience = params[:experience] 
Proficiency.create(:experience => @experience.to_i, :formal_education => @formal_education, :user_id =>@user.id, :skill_id => @skill.id)
redirect '/users/skills'
end
