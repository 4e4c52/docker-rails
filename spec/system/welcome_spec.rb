require 'rails_helper'

RSpec.describe 'Welcome' do
  it 'shows the number of page views' do
    visit '/'
    expect(page.text).to match(/This page has been viewed [0-9]+ times?/)
  end

  it 'renders js', js: true do
    visit '/'
    expect(page.text).to have_text('Hello World!')
  end
end
