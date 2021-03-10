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
        i=i+1
      end
    end
  end
  #cutoff_time = 24.hours.from_now + 15.minutes
end