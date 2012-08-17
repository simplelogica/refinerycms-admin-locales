# encoding: utf-8
require "spec_helper"

module Refinery
  module AdminLocales
    module Admin
      describe AdminLocalesController do
        render_views
        refinery_login_with_factory :refinery_user

        before(:each) do
          Refinery::User.first.update_attribute(:locale, locale)
          get :index
        end

        context "without locale" do
          let(:locale) { nil }

          it { response.should be_success }
          it { response.should render_template(:index) }
          it { response.body.should match("Switch to your website") }
          it { ::I18n.locale.should eq ::Refinery::I18n.current_locale }
        end

        context "with en locale" do
          let(:locale) { :en }

          it { response.should be_success }
          it { response.should render_template(:index) }
          it { response.body.should match("Switch to your website") }
          it { ::Refinery::I18n.current_locale.should eq "en" }
          it { ::I18n.locale.should eq :en }
        end

        context "with en locale" do
          let(:locale) { :es }

          it { response.should be_success }
          it { response.should render_template(:index) }
          it { response.body.should match("Ver tu web") }
          it { ::Refinery::I18n.current_locale.should eq "es" }
          it { ::I18n.locale.should eq :es }
        end
      end
    end
  end
end
