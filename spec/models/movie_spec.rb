require 'spec_helper'

describe Movie do
	fixtures :movies
	describe 'find_by_same_director' do
		it 'should find movies by the same director' do
			diff = movies(:time_bandits_movie).find_by_same_director - [movies(:time_bandits_movie), movies(:holy_grail_movie)]
			diff.should == []
		end
		it 'should raise NoDirectorError if there\'s no director info' do
			# Sunset Boulevard and Double Indemnity both have a blank director
			lambda { movies(:sunset_boulevard_movie).find_by_same_director }.should raise_error(Movie::NoDirectorError)
		end
	end
end