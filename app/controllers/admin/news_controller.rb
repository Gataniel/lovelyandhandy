class Admin::NewsController < Admin::ApplicationController
  def index
    @news = New.all
  end
end
