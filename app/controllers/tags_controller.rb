class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @company = Company.new
    @button = 'Создать компанию'
    @companies = Company.order(:name).page(params[:page]).per(5)

  end
end
