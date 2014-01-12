class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update]

  def show
    @company = Company.new
    @companies = Company.all
  end

  def new
    @rubric = Rubric.find(params[:post_id])
    @tag = Tag.new
  end

  def edit
    @rubric = @tag.rubric
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.user = current_user
    @tag.rubric = Rubric.find(params[:rubric_id])
    if @tag.save
      redirect_to rubric_path(@tag.rubric), notice: 'Принято'
    else
      redirect_to :back, alert: 'Ошибка'
    end
  end

  def update
    if @tag.update(tag_params)
      redirect_to @tag.rubric, notice: 'Тег обновлен'
    else
      redirect_to @tag.rubric, alert: 'Ошибка'
    end
  end

  def destroy
    @tag.destroy
    redirect_to root_url, notice: 'Тег удален'
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:link, :name, :body)
  end

  def check_user
    redirect_to rubrics_url, notice: 'Нельзя!' if @tag.user != current_user
  end
end
