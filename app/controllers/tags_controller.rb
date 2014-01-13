class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @company = Company.new
    @button = 'Создать компанию'
    @companies = Company.order(:name).page(params[:page]).per(10)

  end
end
