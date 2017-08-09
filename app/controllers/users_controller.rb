class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:add_interest, :remove_interest, :add_proficiency, :remove_proficiency]
  # index
  def index
    @skills = Skill.all
  end

  # new
  def new
    @skill = Skill.new
  end

  # create
  def create
    @skill = Skill.create(skill_params)
    redirect_to @skill
  end

  #show
  def show
    @skill = Skill.find(params[:id])
  end

  # edit
  def edit
    @skill = Skill.find(params[:id])
  end

  # update
  def update
    @skill = Skill.find(params[:id])
    @skill.update(skill_params)
    redirect_to @skill
  end

  # destroy
  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to skills_path
  end

  def add_proficiency
    @skill = Skill.find(params[:id])
    @skill.proficiencies.create(user: current_user)
    redirect_to skills_path
  end

  def remove_proficiency
    Proficiency.find_by(user: current_user, skill_id: params[:id]).destroy
    redirect_to skills_path
  end

  def add_interest
    @skill = Skill.find(params[:id])
    @skill.interests.create(user: current_user)
    redirect_to skills_path
  end

  def remove_interest
    Interest.find_by(user: current_user, skill_id: params[:id]).destroy
    redirect_to skills_path
  end

  private
  def skill_params
    params.require(:skill).permit(:name)
  end
end
