require 'nokogiri'
require 'open-uri'
class CrawlersController < ApplicationController
  before_action :set_crawler, only: [:show, :edit, :update, :destroy]

  # GET /crawlers
  # GET /crawlers.json
  def index
    @crawlers = Crawler.all
  end

  # GET /crawlers/1
  # GET /crawlers/1.json
  def show
  end

  # GET /crawlers/new
  def new
    @crawler = Crawler.new
  end

  # GET /crawlers/1/edit
  def edit
  end

  # POST /crawlers
  # POST /crawlers.json
  def create
    @crawler = Crawler.new(crawler_params)

    respond_to do |format|
      if @crawler.save
        format.html { redirect_to @crawler, notice: 'Crawler was successfully created.' }
        format.json { render action: 'show', status: :created, location: @crawler }
      else
        format.html { render action: 'new' }
        format.json { render json: @crawler.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crawlers/1
  # PATCH/PUT /crawlers/1.json
  def update
    respond_to do |format|
      if @crawler.update(crawler_params)
        format.html { redirect_to @crawler, notice: 'Crawler was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @crawler.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crawlers/1
  # DELETE /crawlers/1.json
  def destroy
    @crawler.destroy
    respond_to do |format|
      format.html { redirect_to crawlers_url }
      format.json { head :no_content }
    end
  end
  

  def site_crawler
    # Get a Nokogiri::HTML::Document for the page we’re interested in...
  p params[:url]
  doc = Nokogiri::HTML(open(params[:url]))

# Do funky things with it using Nokogiri::XML::Node methods...

  puts doc.class
  @title = doc.title
  puts @title
  @links=doc.css('#login a')
  puts @links
  puts "success"
    respond_to do |format|
      format.html { redirect_to crawlers_url, notice: 'Site was successfully crawled.' }
    end

  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crawler
      @crawler = Crawler.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crawler_params
      params.require(:crawler).permit(:url, :title)
    end
end
