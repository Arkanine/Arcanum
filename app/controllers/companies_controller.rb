class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]

  def index
    @companies = Company.order('name').paginate(per_page:3, page:params[:page]).search(params[:search])
  end

  def new
    @tag = Tag.find(params[:tag_id])
    @company = Comment.new
  end

  def create
    @company = Company.new(company_params)
    @company.user = current_user
    @company.tag = Tag.find(params[:tag_id])
      if @company.save
        redirect_to tag_path(@company.tag), notice: 'Есть'
      else
        redirect_to :back, alert: 'Проверьте сообщение'
      end
  end

  def edit
    @tag = @company.tag
    @button = 'Исправить компанию'
  end

  def update
    if @company.update(company_params)
      redirect_to @company.tag, notice: 'Тег обновлен'
    else
      redirect_to :back, alert: 'Ошибка'
    end
  end

  def destroy
    @company.destroy
    redirect_to @company.tag, notice: 'Компания удалена'
  end

  private

  def company_params
    params.require(:company).permit(:name, :phone, :address)
  end

  def set_company
    @company = Company.find(params[:id])
  end

  def check_user
    redirect_to root_url, notice: 'Нельзя!' if @company.user != current_user
  end

end
