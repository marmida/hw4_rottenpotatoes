Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.new({
      :title => movie['title'],
      :rating => movie['rating'],
      :release_date => movie['release_date'],
      :director => movie['director'],
    }).save
  end
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |title, director|
	# assert that at least one film matches this title, director combination in the database
	assert Movie.where({:title=>title, :director=>director})
end

# scaffolding
Given /^PENDING/ do
  pending
end