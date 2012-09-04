# encoding: utf-8
require "spec_helper"

describe "admin_locales" do
  refinery_login_with :refinery_user

  let(:locale) { 'en' }
  let(:another_locale) { 'es' }
  let(:user) { Refinery::User.first }
  let(:user_with_another_locale) { FactoryGirl.create(:user_with_locale, :locale => another_locale) }
  let(:user_without_locale) { FactoryGirl.create(:user) }
  before(:each) do
    user.update_attribute(:locale, locale)
    user_with_another_locale
    user_without_locale
  end

  context "list" do
    before { visit refinery.admin_locales_admin_admin_locales_path }

    it "shows user with locale username" do
      page.should have_xpath("//span[@class='title']//strong", :text => user.username)
    end

    it "shows user with locale locale" do
      page.should have_xpath("//span[@class='title']//span[@class='preview']", :text => Refinery::I18n.locales[locale.to_sym])
    end

    it "shows user with another locale username" do
      page.should have_xpath("//span[@class='title']//strong", :text => user_with_another_locale.username)
    end

    it "shows user with another locale locale" do
      page.should have_xpath("//span[@class='title']//span[@class='preview']", :text => Refinery::I18n.locales[another_locale.to_sym])
    end

    it "shows user without locale username" do
      page.should have_xpath("//span[@class='title']//strong", :text => user_without_locale.username)
    end

    it "shows user with another locale locale" do
      page.should have_xpath("//span[@class='title']//span[@class='preview']", :text => 'Locale: Default')
    end
  end

  describe "edit an user" do

    it "with locale shows a select with the locale selected" do
      visit refinery.edit_admin_locales_admin_admin_locale_path(user)
      page.should have_xpath("//div[@class='field']//option[@selected='selected' and @value='#{locale}']")
    end

    it "with another locale shows a select with the locale selected" do
      visit refinery.edit_admin_locales_admin_admin_locale_path(user_with_another_locale)
      page.should have_xpath("//div[@class='field']//option[@selected='selected' and @value='#{another_locale}']")
    end

    it "without locale shows a select without locale selected" do
      visit refinery.edit_admin_locales_admin_admin_locale_path(user_without_locale)
      page.should_not have_xpath("//div[@class='field']//option[@selected='selected']")
    end

    context "and change locale" do
      it "should render user list successfully" do
        visit refinery.edit_admin_locales_admin_admin_locale_path(user)
        select(Refinery::I18n.locales[another_locale.to_sym], :from => 'user_locale')
        click_button 'submit_button'
        # Flash message should be in previous locale, because locale is set acter the flash
        page.should have_content("#{user.username} was successfully updated.")
        # But content should be in new locale
        page.should have_xpath("//span[@class='title']//span[@class='preview']", :text => 'Idioma: Español')
      end

      it "should change user locale" do
        visit refinery.edit_admin_locales_admin_admin_locale_path(user)
        expect{
          select(Refinery::I18n.locales[another_locale.to_sym], :from => 'user_locale')
          click_button 'submit_button'
          user.reload
        }.to change(user,:locale).from(locale).to(another_locale)
      end
    end


  end
end
