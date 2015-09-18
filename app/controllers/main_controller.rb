class MainController < ApplicationController
  def home; end

  def about
    @about = AboutSection.take
  end
end
