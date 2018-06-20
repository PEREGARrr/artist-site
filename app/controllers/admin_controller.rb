# frozen_string_literal: true

#
# Admin controller
# Controller for website records
#
class AdminController < ApplicationController
  http_basic_authenticate_with(
    name: ENV['USERNAME'], password: ENV['PASSWORD']
  )

  def index
    @artworks = Artwork.all
  end

  def featured
    @artworks = Artwork.where(featured: true)
  end

  # ***************************
  # Artwork Routes
  # ***************************

  def artwork
    @artworks = Artwork.all
  end

  def pastel
    @artworks = Artwork.where(artwork_type: :pastel)
  end

  def paintings
    @artworks = Artwork.where(artwork_type: :painting)
  end

  def sketches
    @artworks = Artwork.where(artwork_type: :sketch)
  end

  def for_sale
    @artworks = Artwork.where(for_sale: true)
  end

end
