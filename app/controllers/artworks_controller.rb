# frozen_string_literal: true

#
# Artwork controller
# CRUD controller for managing artwork
#
class ArtworksController < ApplicationController
  http_basic_authenticate_with(
    name: ENV['USERNAME'], password: ENV['PASSWORD'],
    except: %i(index show pastel sketches paintings for_sale featured)
  )

  before_action :set_artwork, only: %i(show edit update destroy)

  # ***************************
  # C - Create Methods
  # ***************************

  # GET /artwork/new
  # Instantiates a new artwork object
  def new
    @artwork = Artwork.new
  end

  # POST /artwork
  # Create artwork and save to database, render show view if success, else render new view
  def create
    @artwork = Artwork.new(artwork_params)

    respond_to do |format|
      if @artwork.save
        format.html { redirect_to @artwork, notice: 'Artwork successfully created.' }
        format.json { render :show, status: :created, location: @artwork }
      else
        format.html { render :new }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # ***************************
  # R - Read Methods
  # ***************************

  # GET /artwork
  def index
    @images = Artwork.paginate(page: params[:page], per_page: 12)
  end

  # GET /artwork/:title_slug
  # Show single artwork in previewer view
  def show() end

  # GET /artwork/types/featured
  # Show featured artwork
  def featured
    @images = Artwork.where(featured: true).paginate(page: params[:page], per_page: 8)
  end

  # GET /artwork/types/pastel
  # Aggregate by pastel paintings
  def pastel
    @images = Artwork.where(artwork_type: :pastel).paginate(page: params[:page], per_page: 12)
  end

  # GET /artwork/types/painting
  # Aggregate by paintings
  def paintings
    @images = Artwork.where(artwork_type: :painting).paginate(page: params[:page], per_page: 12)
  end

  # GET /artwork/types/sketch
  # Aggregate by sketches
  def sketches
    @images = Artwork.where(artwork_type: :sketch).paginate(page: params[:page], per_page: 12)
  end

  # GET /artwork/types/for_sale
  # Select artworks for sale (for_sale boolean)
  def for_sale
    @images = Artwork.where(for_sale: true).paginate(page: params[:page], per_page: 12)
  end

  # ***************************
  # U - Update Methods
  # ***************************

  # GET /artwork/:title_slug/edit
  # Find artwork to be updated
  def edit() end

  # PATCH/PUT /artwork/:title_slug
  # Update artwork with new params
  def update
    respond_to do |format|
      if @artwork.update(artwork_params)
        format.html { redirect_to @artwork, notice: 'Artwork was successfully updated.' }
        format.json { render :show, status: :ok, location: @artwork }
      else
        format.html { render :edit }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # ***************************
  # D - Delete Methods
  # ***************************

  # DELETE /artwork/:title_slug
  # Find artwork by id and delete from database, redirect to artworks_url
  def destroy
    @artwork.destroy

    respond_to do |format|
      format.html { redirect_to artworks_url, notice: 'Artwork was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # ***************************
  # Private Methods
  # ***************************

  private

  def set_artwork
    @artwork = Artwork.friendly.find(params[:id])
  end

  def artwork_params
    params.require(:artwork)
      .permit(:title, :featured, :for_sale, :artwork_type, :size, :price, :media, :image)
  end
end
