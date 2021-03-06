class BidsController < ApplicationController
  def index
    matching_bids = Bid.all

    @list_of_bids = matching_bids.order({ :created_at => :desc })

    render({ :template => "bids/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_bids = Bid.where({ :id => the_id })

    @the_bid = matching_bids.at(0)

    render({ :template => "bids/show.html.erb" })
  end

  def create
    the_bid = Bid.new
    the_bid.job_seeker_id = params.fetch("query_job_seeker_id")
    the_bid.job_id = params.fetch("query_job_id")
    the_bid.points_bid = params.fetch("query_points_bid")

    if the_bid.valid?
      the_bid.save
      redirect_to("/bids", { :notice => "Bid created successfully." })
    else
      redirect_to("/bids", { :notice => "Bid failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_bid = Bid.where({ :id => the_id }).at(0)

    the_bid.job_seeker_id = params.fetch("query_job_seeker_id")
    the_bid.job_id = params.fetch("query_job_id")
    the_bid.points_bid = params.fetch("query_points_bid")

    if the_bid.valid?
      the_bid.save
      redirect_to("/bids/#{the_bid.id}", { :notice => "Bid updated successfully."} )
    else
      redirect_to("/bids/#{the_bid.id}", { :alert => "Bid failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_bid = Bid.where({ :id => the_id }).at(0)

    the_bid.destroy

    redirect_to("/bids", { :notice => "Bid deleted successfully."} )
  end
end
