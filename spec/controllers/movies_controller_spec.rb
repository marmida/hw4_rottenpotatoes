require 'spec_helper'

describe MoviesController do
	describe 'director' do
		before :each do
			@mock_movie = mock('Movie')
			@mock_director_results = [mock('Movie'), mock('Movie')]
		end

		it 'should delegate to director search in the model' do
			Movie.should_receive(:find).with('1').and_return(@mock_movie)
			@mock_movie.should_receive(:find_by_same_director).and_return(@mock_director_results)
			get :director, :id => '1'
			response.should render_template('director')
		end
		it 'should render the director search template' do
			Movie.stub(:find).and_return(@mock_movie)
			@mock_movie.stub(:find_by_same_director).and_return(@mock_director_results)
			get :director, :id => '1'
			assigns(:movies).should == @mock_director_results
			response.should render_template('director')
		end
		it 'should redirect with a flash for a film with no director' do
			Movie.stub(:find).and_return(@mock_movie)
			@mock_movie.stub(:title).and_return('Test Title')
			@mock_movie.stub(:find_by_same_director).and_raise(Movie::NoDirectorError)
			get :director, :id => '1'
			flash[:warning].should == "'Test Title' has no director info"
			response.should redirect_to(movies_path)
		end			
	end
end