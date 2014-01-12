class RubricsController < ApplicationController

  def index
    @rubrics = Rubric.all
    @tags = Tag.all
    @companies = Company.all
  end

  def show
    @tags = Tag.all
    @rubric = Rubric.find(params[:id])
  end

end
