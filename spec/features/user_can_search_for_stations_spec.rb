require 'rails_helper'

describe 'A user' do
  it 'can search for closest electric and propane stations' do
    visit '/'

    fill_in 'q', with: '80203'
    click_on 'Locate'

    expect(current_path).to eq('/search')
    expect(stations.count).to eq(10)
    expect(page).to have_content(station.first.name)
    expect(page).to have_content(station.first.address)
    expect(page).to have_content(station.first.fuel_type)
    expect(page).to have_content(station.first.distance)
    expect(page).to have_content(station.first.access_time)
  end
end