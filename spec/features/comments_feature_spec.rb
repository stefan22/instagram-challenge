require 'rails_helper'

feature 'comments' do
  before {Picture.create(name:'pic1')}

  scenario 'allow users to leave comments using a form' do
    visit '/pictures'
    click_link 'Comment pic1'
    fill_in 'Thoughts', with: 'nice pic'
    select '3', from: 'Like'
    click_button 'Leave Comment'

    expect(current_path).to eq '/pictures'
    expect(page).to have_content 'nice pic'
  end
end
