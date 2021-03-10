class WinnersController < ApplicationController
  def index
    matching_winners = Winner.all

    @list_of_winners = matching_winners.order({ :created_at => :desc })

    render({ :template => "winners/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_winners = Winner.where({ :id => the_id })

    @the_winner = matching_winners.at(0)

    render({ :template => "winners/show.html.erb" })
  end

  def create
    the_winner = Winner.new
    the_winner.seeker_id = params.fetch("query_seeker_id")
    the_winner.job_id = params.fetch("query_job_id")

    if the_winner.valid?
      the_winner.save
      redirect_to("/winners", { :notice => "Winner created successfully." })
    else
      redirect_to("/winners", { :notice => "Winner failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_winner = Winner.where({ :id => the_id }).at(0)

    the_winner.seeker_id = params.fetch("query_seeker_id")
    the_winner.job_id = params.fetch("query_job_id")

    if the_winner.valid?
      the_winner.save
      redirect_to("/winners/#{the_winner.id}", { :notice => "Winner updated successfully."} )
    else
      redirect_to("/winners/#{the_winner.id}", { :alert => "Winner failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_winner = Winner.where({ :id => the_id }).at(0)

    the_winner.destroy

    redirect_to("/winners", { :notice => "Winner deleted successfully."} )
  end
end
