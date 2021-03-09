task({:hello => :environment}) do
  p "Howdy"
  p "World"

  #cutoff_time = 24.hours.from_now + 15.minutes
end