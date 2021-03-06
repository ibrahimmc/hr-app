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
    points_to_use = params.fetch("query_bid_set").to_i

    if @current_seeker.bid_points >= points_to_use
      the_bid = Bid.new
      the_bid.seeker_id = @current_seeker.id
      the_bid.job_id = params.fetch("query_job_id")

      the_bid.points_bid = points_to_use
      @current_seeker.bid_points = @current_seeker.bid_points - points_to_use
      

      if the_bid.valid?
        the_bid.save
        @current_seeker.save
        redirect_to("/bids", { :notice => "Bid created successfully." })
      else
        redirect_to("/bids", { :notice => "Bid failed to create successfully." })
      end
    
    else 
      redirect_to("/bids", { :notice => "Bid failed to create successfully due to insufficient amount of points. You only have " + @current_seeker.bid_points.to_s + " points and thus cannot set a " + points_to_use.to_s + " bid" })
    end 

  end

  def update
    points_to_use = params.fetch("query_bid_new").to_i
    the_id = params.fetch("path_id")
    the_bid = Bid.where({ :id => the_id }).at(0)

    if @current_seeker.bid_points >= (points_to_use - the_bid.points_bid)
      #the_bid.seeker_id = @current_seeker.id
      #the_bid.job_id = params.fetch("query_job_id")  
      @current_seeker.bid_points = @current_seeker.bid_points - (points_to_use - the_bid.points_bid)
      the_bid.points_bid = points_to_use

      if the_bid.valid?
        the_bid.save
        @current_seeker.save
        redirect_to("/bids/#{the_bid.id}", { :notice => "Bid updated successfully."} )
      else
        redirect_to("/bids/#{the_bid.id}", { :alert => "Bid failed to update successfully." })
      end
    
    else
      redirect_to("/bids", { :notice => "Bid failed to create successfully due to insufficient amount of points. You only have " + @current_seeker.bid_points.to_s + " points and thus cannot set a " + points_to_use.to_s + " bid" })
    end


  end

  def destroy
    the_id = params.fetch("path_id")
    the_bid = Bid.where({ :id => the_id }).at(0)

    the_bid.destroy

    redirect_to("/bids", { :notice => "Bid deleted successfully."} )
  end
end
