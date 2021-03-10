task({:auction_results => :environment}) do
  
  Job.all.each do |a_job|
    seats_available = a_job.seats
    
    bidders_for_a_job = Bid.all.where({:job_id => a_job.id}).order({:points_bid => :desc, :created_at => :asc })

    if bidders_for_a_job.size != 0
      i=0
      fill = [bidders_for_a_job.size, seats_available].min
      fill.times do
        the_winner = Winner.new
        the_winner.job_id = a_job.id 
        the_winner.seeker_id =  bidders_for_a_job.at(i).seeker_id
        the_winner.save
        p bidders_for_a_job.at(i).seeker.first_name     
        
        i=i+1
      end
    
    end

  end






  
  #award auction winners somehow, do we need a winner's table? Yes because more than one winner per job after we process the bids
    # create a winners table with row for job and row for seeker
    # create the code that can start the bidding process
    # make it timed with Heruko

  
  #cutoff_time = 24.hours.from_now + 15.minutes
end