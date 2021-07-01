class ReturnsController < ApplicationController

    def create
        return_book = Return.where(user_id: return_params[:user_id], library_id: return_params[:library_id])
        Return.create(return_params) if return_book.blank?

        overdraft_book = Overdraft.where(user_id: return_params[:user_id], library_id: return_params[:library_id])
        overdraft_book.destroy_all if overdraft_book.present?

        render json: 'Devolución realizado con éxito'
    end

    private

    def return_params
        params.require(:return).permit(:user_id, :library_id)
    end

end
