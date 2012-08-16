# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "AdminLocales" do
    describe "Admin" do
      describe "admin_locales" do
        login_refinery_user

        describe "admin_locales list" do
          before(:each) do
            FactoryGirl.create(:user_with_locale, :locale => "es")
            FactoryGirl.create(:user_with_locale, :locale => "en")
          end

          it "shows two items" do
            visit refinery.admin_locales_admin_admin_locales_path
            page.should have_content("es")
            page.should have_content("en")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.admin_locales_admin_admin_locales_path

            click_link "Add New Admin Locale"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Locale", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::AdminLocales::AdminLocale.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Locale can't be blank")
              Refinery::AdminLocales::AdminLocale.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:user_with_locale, :locale => "UniqueTitle") }

            it "should fail" do
              visit refinery.admin_locales_admin_admin_locales_path

              click_link "Add New Admin Locale"

              fill_in "Locale", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::AdminLocales::AdminLocale.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:user_with_locale, :locale => "A locale") }

          it "should succeed" do
            visit refinery.admin_locales_admin_admin_locales_path

            within ".actions" do
              click_link "Edit this admin locale"
            end

            fill_in "Locale", :with => "A different locale"
            click_button "Save"

            page.should have_content("'A different locale' was successfully updated.")
            page.should have_no_content("A locale")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:user_with_locale, :locale => "es") }

          it "should succeed" do
            visit refinery.admin_locales_admin_admin_locales_path

            click_link "Remove this admin locale forever"

            page.should have_content("'es' was successfully removed.")
            Refinery::AdminLocales::AdminLocale.count.should == 0
          end
        end

      end
    end
  end
end
