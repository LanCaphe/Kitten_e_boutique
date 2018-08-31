require 'rails_helper'

RSpec.describe "home/product-show.html.erb", type: :view do
  def visit_homepage
    visit('/')
  end
end
