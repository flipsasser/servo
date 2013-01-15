require 'spec_helper'

describe Servo do
  let(:servo_directory) { File.expand_path(File.join('..', 'fixtures'), File.dirname(__FILE__)) }
  let(:app) { Servo.app(servo_directory) }

  before do
    Capybara.app = app
  end

  it "serves a directory listing" do
    visit '/images'
    page.should have_content('app-icon.png')
  end

  it "serves index files if they're present" do
    visit '/'
    page.should have_content('welcome to servo!')
  end
end
