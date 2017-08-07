class SkillsController < ApplicationController
  before_action :authenticate_user!, only: [:add_interest, :add_proficiency, :remove_interest :remove_proficiency]
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

  def add_favorite
    @skill = Skill.find(params[:id])
    @skill.favorites.create(user: current_user)
    redirect_to :back
  end

  def remove_favorite
    Favorite.find_by(user: current_user, skill_id: params[:id]).destroy
    redirect_to :back
  end

  private
  def skill_params
    params.require(:skill).permit(:title, :album, :preview_url)
  end
end
