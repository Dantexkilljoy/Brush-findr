class ProgramsController < ApplicationController
  def index
    matching_programs = Program.all

    @list_of_programs = matching_programs.order({ :created_at => :desc })

    render({ :template => "programs/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_programs = Program.where({ :id => the_id })

    @the_program = matching_programs.at(0)

    render({ :template => "programs/show.html.erb" })
  end

  def create
    the_program = Program.new
    the_program.name = params.fetch("query_name")

    if the_program.valid?
      the_program.save
      redirect_to("/programs", { :notice => "Program created successfully." })
    else
      redirect_to("/programs", { :alert => the_program.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_program = Program.where({ :id => the_id }).at(0)

    the_program.name = params.fetch("query_name")

    if the_program.valid?
      the_program.save
      redirect_to("/programs/#{the_program.id}", { :notice => "Program updated successfully."} )
    else
      redirect_to("/programs/#{the_program.id}", { :alert => the_program.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_program = Program.where({ :id => the_id }).at(0)

    the_program.destroy

    redirect_to("/programs", { :notice => "Program deleted successfully."} )
  end
end
