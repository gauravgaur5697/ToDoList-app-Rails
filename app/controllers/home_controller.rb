class HomeController < ApplicationController
  def index
  end

  def about
  	@about_me = "My name is Gaurav Gaur"
  	
  	@about_website = "This is the basic ruby website we have created on rails  just to try our learning practically.
  	You can login here using your email and can create the to do list for yourself it will be private and no one could look into your todolist
  		

  		Good day!"
  end
end
