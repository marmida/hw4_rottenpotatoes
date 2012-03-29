class Movie < ActiveRecord::Base
  class NoDirectorError < StandardError
  end


  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def find_by_same_director
  	raise NoDirectorError if (director == '' || director.nil?)
  	
  	# return an array of Movies that match the director of self
  	Movie.where :director => director
  end
end
