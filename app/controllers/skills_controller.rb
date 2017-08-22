class SkillsController < ApplicationController
  before_action :authenticate_user!, only: [:add_interest, :remove_interest, :add_proficiency, :remove_proficiency]
  # index
  def index
    @skills = Skill.all
  end

  # action not available in config/routes.rb
  # # new
  # def new
  #   @skill = Skill.new
  # end

  # action not available in config/routes.rb
  # # create
  # def create
  #   @skill = Skill.create(skill_params)
  #   redirect_to @skill
  # end

  #show
  def show
    @skills = Skill.all
    @skill = Skill.find(params[:id])
    # if this method relies on `current_user`, then we need to ensure that
    # the user is logged in via an if statement as follows, or add this
    # method/action to the list of `before_action :authenticate_user! at the top`
    if current_user
      @proficiency = current_user.proficiencies.new
      @interest = current_user.interests.new
    else
      @proficiency = nil
      @interest = nil
    end
  end

  # action not available in config/routes.rb
  # # edit
  # def edit
  #   @skill = Skill.find(params[:id])
  # end

  # action not available in config/routes.rb
  # # update
  # def update
  #   @skill = Skill.find(params[:id])
  #   @skill.update(skill_params)
  #   redirect_to @skill
  # end

  # action not available in config/routes.rb
  # # destroy
  # def destroy
  #   @skill = Skill.find(params[:id])
  #   @skill.destroy
  #   redirect_to skills_path
  # end

  def edit_proficiency
    @skills = Skill.all
    @skill = Skill.find(params[:id])

  end

  def add_proficiency
    @skill = Skill.find(params[:id])
    @skill.proficiencies.create!(proficiency_params.merge({ user: current_user }))
    flash[:notice] = "Proficiency Added!"
    redirect_to root_path
  end

  def remove_proficiency
    Proficiency.find_by(user: current_user, skill_id: params[:id]).destroy
    flash[:notice] = "Proficiency Removed!"
    redirect_to root_path
  end

  def update_proficiency
    @skill = Skill.find(params[:id])
    Proficiency.update!(proficiency_params.merge({ user: current_user }))
    redirect_to root_path
  end


  def add_interest
    @skill = Skill.find(params[:id])
    @skill.interests.create!(interest_params.merge({ user: current_user }))
    flash[:notice] = "Interest Added!"
    redirect_to root_path
  end

  def remove_interest
    Interest.find_by(user: current_user, skill_id: params[:id]).destroy
    flash[:notice] = "Interest Removed!"
    redirect_to root_path
  end

  private

  def proficiency_params
    params.require(:proficiency).permit(:level)
  end
  def interest_params
    params.require(:interest).permit(:level)
  end

  def skill_params
    params.require(:skill).permit(:name)
  end
end
