require 'spec_helper'

describe 'dashboard/index.html.erb', type: :view do
  before :each do
    assign(:stats, {articles:{count:10},
                    projects:{count:5},
                    members:{count:100},
                    documents:{count:40},
                    pairing_minutes:{value:300},
                    scrum_minutes:{value:200},
    })


    render

  end

  it 'displays a tab view' do
    expect(rendered).to have_css('ul#tabs')
  end

  describe 'displays statistics: ' do
    it {expect(rendered).to have_content('10 Articles Published')}
    it {expect(rendered).to have_content('5 Active Projects')}
    it {expect(rendered).to have_content('100 AgileVentures Members')}
    it {expect(rendered).to have_content('40 Documents Created')}
    it {expect(rendered).to have_text('300 Pair Programming Minutes')}
    it {expect(rendered).to have_content('200 Scrum Minutes')}
  end

end
