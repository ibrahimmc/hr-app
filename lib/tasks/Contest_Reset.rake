task({:auction_reset => :environment}) do
  Winner.all.each do |a_winner|
    a_winner.destroy
  end

  Bid.all.each do |a_bid|
    a_bid.destroy
  end

  Seeker.all.each do |a_seeker|
    a_seeker.bid_points = 2000
    a_seeker.save
  end

end