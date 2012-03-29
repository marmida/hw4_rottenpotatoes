class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def find_by_same_director
  	# return an array of Movies that match the director of self
  	Movie.where({:director => @director})
  end
end
