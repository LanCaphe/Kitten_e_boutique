require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
#visite la home page
  def visit_homepage
    visit('/')
  end
end
