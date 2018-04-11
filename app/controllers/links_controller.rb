require 'base62'

class LinksController < ApplicationController
  arr = (0..9).to_a
  num_strings = arr.map{|number| number.to_s}
  CHARS = [num_strings.to_a, ('a'..'z').to_a, ('A'..'Z').to_a].flatten

  # GET /users
  def index
    @links = Link.all.order(visits: :desc).limit(100)
    render json: @links
  end

  def show
    @link = Link.find_by(id: params[:id])
    render json: @link
  end

  # POST
  def create
    @link = Link.new(link_params)

    if !@link.long.start_with?("http")
      @link.long = "http://" + @link.long
    end

    if @link.save
      @link.short = generate_short_url

      if @link.save
        render json: @link, status: :created, link: @link
      else
        render json: {
          error: @link.errors
        }, status: :unprocessable_entity
      end
    else
      render json: {
        error: @link.errors
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @link.destroy
  end

  def short
    @link = Link.find_by(id: params[:short].base62_decode)
    if @link
      @link.visits += 1
      @link.save
      redirect_to @link.long
    else
      redirect_to ENV['CLIENT_URL']
    end
  end

  private

  def generate_short_url
    @link.short = @link.id.base62_encode
  end

  def link_params
    params.require(:link).permit(:long)
  end
end
