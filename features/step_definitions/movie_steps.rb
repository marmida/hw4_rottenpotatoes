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

Then /^(?:|I )should not see ("[^"]+") in the movie list$/ do |search|
  within('#movies') do
    step 'I should not see %s' % search
  end
end

# imported from hw3
When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.scan(/[\w-]+/).each do |rating|
    step "I %scheck \"ratings[%s]\"" % [uncheck, rating]
  end
end


# "everything" step
Then /I should see all of the movies/ do 
  # there's one extra TR for the header row
  assert_equal Movie.count + 1, page.all('#movies tr').length
end