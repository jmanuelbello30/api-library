class OverdraftsController < ApplicationController

    def create
        overdraft_book = Overdraft.where(user_id: overdraft_params[:user_id], library_id: overdraft_params[:library_id])
        Overdraft.create(overdraft_params) if overdraft_book.blank?

        return_book = Return.where(user_id: overdraft_params[:user_id], library_id: overdraft_params[:library_id])
        return_book.destroy_all if return_book.present?

        render json: 'Préstamo realizado con éxito'
    end

    private

    def overdraft_params
        params.require(:overdraft).permit(:user_id, :library_id)
    end

end
