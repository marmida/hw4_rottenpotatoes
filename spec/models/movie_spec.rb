require 'spec_helper'

describe Movie do
	fixtures :movies
	describe 'find_by_same_director' do
		it 'should find movies by the same director' do
			diff = movies(:time_bandits_movie).find_by_same_director - [movies(:time_bandits_movie), movies(:holy_grail_movie)]
			diff.should == []
		end
	end
end