class Admin::ProjectsController < ApplicationController
  before_action :stub_company

  def index
    @projects = Project.unscoped.all
  end
end
