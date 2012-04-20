class MemosController < ApplicationController

  def index
    @date=params[:month] ? Date.parse(params[:month]) : Date.today
  end

  def new_memo
    @memo_date = "#{params[:memo_date]}"
    if !Memo.find_by_memo_date(@memo_date)
      render :partial => 'new_memo'
    else
      @memo = Memo.where("memo_date = '#{@memo_date}' and created_by = '#{current_user.login}'").first
      if @memo
        render :partial => 'show_edit'
      else
        render :partial => 'new_memo'
      end
    end
  end

    def add_new_memo
    if  params[:memo_date].to_date >= Date.today
      if Memo.create(:memo => params[:memo], :memo_date => params[:memo_date], :created_by => current_user.login).save
        flash[:notice] = "Successfully created memo for the date #{params[:memo_date]}."
        redirect_to home_index_path
      else
        flash[:error] = "Error while creating memo. Please try again"
        redirect_to home_index_path
      end
    else
      flash[:error] = "Error while creating memo: Selected past date."
      redirect_to home_index_path
    end
  end

  def update
    @memo = Memo.where("memo_date = '#{params[:memo_date]}' and created_by = '#{params[:name]}'").first
    if @memo.update_attribute("memo", params[:memo])
      flash[:notice] = "Successfully updated memo for the date #{params[:memo_date]}."
      redirect_to home_index_path
    else
      flash[:error] = "Error while updating memo. Please try again"
      redirect_to home_index_path
    end
  end
end
