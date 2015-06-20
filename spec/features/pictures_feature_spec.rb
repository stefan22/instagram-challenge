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

  context 'creating a picture' do
    scenario 'prompts user to fill out form then displays the picture' do
        visit '/pictures'
        click_link 'Add a picture'
        fill_in 'Name', with: 'pic1'
        click_button 'Create Picture'
        expect(page).to have_content 'pic1'
        expect(current_path).to eq '/pictures'
    end
  end

  context 'viewing pictures' do
    let!(:pic1){Picture.create(name:'pic1')}

    scenario 'user can view picture' do
        visit '/pictures'
        click_link 'pic1'
        expect(page).to have_content 'pic1'
        expect(current_path).to eq "/pictures/#{pic1.id}"

    end
  end


end
