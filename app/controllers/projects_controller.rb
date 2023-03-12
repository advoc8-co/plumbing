class ProjectsController < ApplicationController
  before_action :stub_company

  def index
    @projects = Project.all
  end
end
