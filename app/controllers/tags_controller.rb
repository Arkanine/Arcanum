class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @company = Company.new
    @companies = Company.all
    @button = 'Создать компанию'
  end

end
