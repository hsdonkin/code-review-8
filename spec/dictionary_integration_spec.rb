require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('adds a new word and goes to the page') do
    visit('/')
    fill_in('input_word_name', :with => 'apple')
    fill_in('input_word_def', :with => 'banana')
    click_on('Add!')
    expect(page).to have_content('apple')
    click_on('apple')
    expect(page).to have_content('banana')
  end
end

describe('delete a word', {:type => :feature}) do
  it('adds a new word and goes to the page, then deletes it') do
    visit('/')
    fill_in('input_word_name', :with => 'apple')
    fill_in('input_word_def', :with => 'banana')
    click_on('Add!')
    expect(page).to have_content('apple')
    click_on('apple')
    click_on('Delete this word forever')
    expect(page).not_to have_content('apple')
  end
end

describe('edit a word definition', {:type => :feature}) do
  it('adds a new word and goes to the page, then deletes it') do
    visit('/')
    fill_in('input_word_name', :with => 'apple')
    fill_in('input_word_def', :with => 'banana')
    click_on('Add!')
    expect(page).to have_content('apple')
    click_on('apple')
    click_on('Update this word')
    fill_in('new_def_1', :with => 'orange')
    click_on('Submit')
    click_on('apple')
    expect(page).not_to have_content('banana')
    expect(page).to have_content('orange')
  end
end
