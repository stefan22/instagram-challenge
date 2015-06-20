require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures have been added yet'
      expect(page).to have_content 'Add a picture'
    end
  end


  context 'pictures have been added' do
    before {Picture.create(name:'pic1')}

    scenario 'should display a picture' do
      visit '/pictures'
      expect(page).to have_content 'pic1'
      expect(page).not_to have_content 'No pictures have been added yet'
    end
  end


end
