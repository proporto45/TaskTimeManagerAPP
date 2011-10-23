class ComponentsController < ApplicationController

  # This is useful for individual component testing
  def index
    if params[:component]
      component_name = params[:component].gsub("::", "_").underscore
      render :inline => "<%= netzke :#{component_name}, :class_name => '#{params[:component]}', :height => 400 %>", :layout => true
    else
      redirect_to root_path
    end
  end

  # This is mapped to "/"
  def home
    render :inline => "<%= netzke :application %>", :layout => true
  end
end
