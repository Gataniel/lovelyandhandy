class MainController < ApplicationController
  def home
    @about = AboutSection.take
  end
end
