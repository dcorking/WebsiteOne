require 'spec_helper'

describe DashboardController, type: :controller do

  describe "GET index" do

    it "renders the correct template" do
      get :index
      expect(response).to render_template 'dashboard/index'
    end

    it "assigns stats variable" do
      allow(controller).to receive(:get_stats).and_return('test')
      get :index
      expect(assigns(:stats)).to eq 'test'
    end
  end

  describe "Data visualisation (users map)" do
    before do 
      thirty_days_ago = (DateTime.now - 33)
      get_country
      @user = FactoryGirl.create(:user,
                              first_name: 'Eric',
                              last_name: 'Els',
                              email: 'eric@somemail.se',
                              title_list: 'Philanthropist',
                              created_at: thirty_days_ago,
                              github_profile_url: 'http://github.com/Eric',
                              skill_list: [ 'Shooting', 'Hooting' ],
                              bio: 'Lonesome Cowboy',
                              country_name: @country[:country_name],
                              country_code: @country[:country_code])
    end

    it "returns the country name and code for each user in JSON" do
      expect(@user[:country_code]).to match(/^[A-Z][A-Z]$/)
    end

  end

end
