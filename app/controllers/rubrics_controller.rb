class RubricsController < ApplicationController
  before_action :set_rubric, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]

  def index
    @rubrics = Rubric.all
    @tags = Tag.all
    @companies = Company.all
  end

  def show
    @tag = Tag.new
    @tags = Tag.all
  end

  def new
    @rubric = Rubric.new
  end

  def edit
  end

  def create
    @rubric = Rubric.new(rubric_params)
    @rubric.user = current_user
    if @rubric.save
      redirect_to root_path, notice: 'Рубрика создана'
    else
      render action: 'new'
    end
  end

  def update
    if @rubric.update(rubric_params)
      redirect_to @rubric, notice: 'Рубрика обновлена'
    else
      render action: 'edit'
    end
  end

  def destroy
    @rubric.destroy
    redirect_to rubrics_url, notice: 'Рубрика удалена'
  end

  private

  def set_rubric
    @rubric = Rubric.find(params[:id])
  end

  def rubric_params
    params.require(:rubric).permit(:name, :body)
  end

  def check_user
    redirect_to rubrics_url, notice: 'Нельзя!' if @rubric.user != current_user
  end
end
