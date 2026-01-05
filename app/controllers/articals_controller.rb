class ArticalsController < ApplicationController
  before_action :set_artical, only: %i[show edit update destroy]

  def index
    @articals = Artical.all
    if params[:category].present?
    @articals = @articals.where("LOWER(category) = ?", params[:category].downcase)
    end

    if params[:search].present?
      @articals = @articals.where("LOWER(title) LIKE ? OR LOWER(description) LIKE ?", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%")
    end
  end

  def show
    # @artical is already set by set_artical
  end

  def new
    @artical = Artical.new
  end

  def edit
  end

  def create
    @artical = Artical.new(artical_params)

    if @artical.save
      redirect_to @artical, notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @artical.update(artical_params)
      redirect_to @artical, notice: "Article was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @artical.destroy
    if Artical.count == 0
      ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='articals'")
    end
    redirect_to articals_path, alert: "Article was successfully destroyed.", status: :see_other
  end

  private

  def set_artical
    @artical = Artical.find(params[:id])
  end

  def artical_params
    params.require(:artical).permit(:title, :description, :category)
  end
end
