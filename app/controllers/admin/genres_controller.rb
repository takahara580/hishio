class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genres = Genre.all
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = "ジャンルを保存しました。"
      redirect_to admin_genres_path
    else
      flash[:danger] = "ジャンル名を入力してください"
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:success] = "ジャンル名を変更しました。"
      redirect_to admin_genres_path
    else
      flash[:danger] = "ジャンル名を入力してください。"
      redirect_to admin_genres_path
    end
  end

   private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
