class LibrariesController < ApplicationController
    def index
        render json: Library.all
    end

    def create
        library = Library.create(library_params)
        render json: library
    end

    def show
        library = Library.find(params[:id])
        render json: library
    end

    def update
        library = Library.find(params[:id])
        library.update(library_params)
        render json: library
    end

    def destroy
        library = Library.find(params[:id])
        library.destroy
        render json: 'Deleted'
    end

    private

    def library_params
        params.require(:library).permit(:title)
    end

end
