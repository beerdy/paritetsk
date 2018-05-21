class YouTube
  attr_accessor :code
  attr_accessor :description
end
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def initialize
    super
    @title = Content.first.slave

    @contents = Content.all
    @menus = Array.new()
    read_ico
    read_background
    read_body
    read_menu
    read_logo
    read_slider
    read_slogan
    read_about
    read_copyright
    read_social
    read_statistic
    read_heads
    @email = Email.new
    read_map
    init_youtube
  end

  private
  def read_ico
    @ico = @contents[10].image.url
  end
  def read_background
    @background = @contents[9].image.url
  end
  def read_body
    @body = @contents[11].image.url
  end
  def read_menu
    @contents[0].description.each_line do |menu|
      @menus.push menu
    end
  end
  def read_logo
    @logo = @contents[0].image.url
  end
  def read_slider
    @slider = @contents[8].image.url
  end
  def read_slogan
    @slogan_ico  = @contents[1].url.html_safe
    @slogan_head = @contents[1].description
    @slogan_text = @contents[1].slave.html_safe
  end
  def read_about
    @about_title, @about_us, @about_name = @contents[2].title.split(';')
    @about_text = @contents[2].description.html_safe
  end
  def read_copyright
    @copyright = @contents[3].description.html_safe
  end
  def read_social
    @social = @contents[4].description
  end
  def read_statistic
    @statistic = @contents[5].description
  end
  def read_heads
    @contents[6].description.each_line do |value|
      eval(value)
    end
  end
  def read_map
    @map = @contents[7].description.html_safe
    @footer = @contents[7].slave.html_safe
  end
  def init_youtube
    youtube = Object.new
    @contents.each do |content|
      youtube = content if content.url == 'youtube'
    end
    @youtube_title = youtube.title
    @youtube_code = youtube.slave
    @youtube_description = youtube.description
  end
end
