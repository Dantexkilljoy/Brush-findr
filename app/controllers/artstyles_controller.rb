class ArtstylesController < ApplicationController
  def index
    matching_artstyles = Artstyle.all

    @list_of_artstyles = matching_artstyles.order({ :created_at => :desc })

    render({ :template => "artstyles/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_artstyles = Artstyle.where({ :id => the_id })

    @the_artstyle = matching_artstyles.at(0)

    render({ :template => "artstyles/show.html.erb" })
  end

  def create
    the_artstyle = Artstyle.new
    the_artstyle.name = params.fetch("query_name")

    if the_artstyle.valid?
      the_artstyle.save
      redirect_to("/artstyles", { :notice => "Artstyle created successfully." })
    else
      redirect_to("/artstyles", { :alert => the_artstyle.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_artstyle = Artstyle.where({ :id => the_id }).at(0)

    the_artstyle.name = params.fetch("query_name")

    if the_artstyle.valid?
      the_artstyle.save
      redirect_to("/artstyles/#{the_artstyle.id}", { :notice => "Artstyle updated successfully."} )
    else
      redirect_to("/artstyles/#{the_artstyle.id}", { :alert => the_artstyle.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_artstyle = Artstyle.where({ :id => the_id }).at(0)

    the_artstyle.destroy

    redirect_to("/artstyles", { :notice => "Artstyle deleted successfully."} )
  end
end
