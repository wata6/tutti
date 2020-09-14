class OrchestrasController < ApplicationController
  before_action :require_user_logged_in
  
  def show
    @orchestra = Orchestra.find(params[:id])
    counts(@orchestra.user)
  end
  
  def new
    if logged_in?
      @orchestra = current_user.build_orchestra  # form_with 用
    end
  end
  
  def create
    @orchestra = current_user.build_orchestra(orchestra_params)
    
    if @orchestra.save
      flash[:success] = '楽団詳細を設定しました。'
      redirect_to @orchestra
    else
      flash.now[:danger] = '楽団詳細の設定に失敗しました。'
      render :new
    end
  end

  def edit
    @orchestra = Orchestra.find(params[:id])
  end

  def update
    @orchestra = Orchestra.find(params[:id])

    if @orchestra.update(orchestra_params)
      flash[:success] = '楽団詳細は正常に更新されました'
      redirect_to @orchestra
    else
      flash.now[:danger] = '楽団詳細は更新されませんでした'
      render :edit
    end
  end
  
  
  private

  def orchestra_params
    params.require(:orchestra).permit(:title, :about, :concert_infomation, :instrument_requirement, :date, :conditions, :cost, :contact)
  end

end
