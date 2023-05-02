class BrushesController < ApplicationController
  def index
    matching_brushes = Brush.all

    @list_of_brushes = matching_brushes.order({ :created_at => :desc })

    render({ :template => "brushes/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_brushes = Brush.where({ :id => the_id })

    @the_brush = matching_brushes.at(0)

    render({ :template => "brushes/show.html.erb" })
  end

  def create
    the_brush = Brush.new
    the_brush.artstyle_id = params.fetch("query_artstyle_id")
    the_brush.program_id = params.fetch("query_program_id")
    the_brush.user_id = params.fetch("query_user_id")
    the_brush.brush_name = params.fetch("query_brush_name")
    the_brush.website_name = params.fetch("query_website_name")

    if the_brush.valid?
      the_brush.save
      redirect_to("/brushes", { :notice => "Brush created successfully." })
    else
      redirect_to("/brushes", { :alert => the_brush.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_brush = Brush.where({ :id => the_id }).at(0)

    the_brush.artstyle_id = params.fetch("query_artstyle_id")
    the_brush.program_id = params.fetch("query_program_id")
    the_brush.user_id = params.fetch("query_user_id")
    the_brush.brush_name = params.fetch("query_brush_name")
    the_brush.website_name = params.fetch("query_website_name")

    if the_brush.valid?
      the_brush.save
      redirect_to("/brushes/#{the_brush.id}", { :notice => "Brush updated successfully."} )
    else
      redirect_to("/brushes/#{the_brush.id}", { :alert => the_brush.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_brush = Brush.where({ :id => the_id }).at(0)

    the_brush.destroy

    redirect_to("/brushes", { :notice => "Brush deleted successfully."} )
  end
end
