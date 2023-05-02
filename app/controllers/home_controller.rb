class HomeController < ApplicationController
  def index
    matching_artstyles = Artstyle.all

    @list_of_artstyles = matching_artstyles.order({ :created_at => :desc })

    matching_programs = Program.all

    @list_of_programs = matching_programs.order({ :created_at => :desc })

    matching_brushes = Brush.all

    @list_of_brushes = matching_brushes.order({ created_at: :desc })

    render({ template: "homepage/index.html.erb" })
  end
end
