class UsersController < ApplicationController
    def index
        render json: User.all
    end

    def create
        user = User.create(user_params)
        render json: user
    end

    def show
        user = User.find(params[:id])
        render json: { user: user, returns: user.returns, overdrafts: user.overdrafts }
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: 'Deleted'
    end

    private

    def user_params
        params.require(:user).permit(:email)
    end
end
