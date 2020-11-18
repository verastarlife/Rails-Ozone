class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=77002&distance=0&API_KEY=99E9ED51-A513-482D-AA3E-93162D184126'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    # Check for empty result
    if @output.empty?
      @final_output = "Errore!"
    elsif !@output
      @final_output = "Errore!"
    else
      @final_output = @output[0]['AQI']
    end

    if @final_output == "Errore!"
      @api_color = "turquoise"
    elsif @final_output <= 50
      @api_color = "green"
      @api_description = "Aria soddisfacente!"
    elsif @final_output >= 51 && @final_output <= 100
      @api_color = "yellow"
      @api_description = "Aria mediocre!"
    elsif @final_output >= 101 && @final_output <= 150
      @api_color = "orange"
      @api_description = "Aria pesante!"
    elsif @final_output >= 151 && @final_output <= 200
      @api_color = "red"
      @api_description = "Aria molto pesante!"
    elsif @final_output >= 201 && @final_output <= 300
      @api_color = "purple"
      @api_description = "Aria possibilemente da evitare!"
    elsif @final_output >= 301 && @final_output <= 500
      @api_color = "maroon" 
      @api_description = "Aria da evitare tutti!"
    end
  end

  def zipcode
    @zip_query = params[:zipcode]

    if params[:zipcode] == ""
      @zip_query = "Ei, hai dimenticato il zipcode!"
    elsif params[:zipcode]
      # Do Api stuff


    require 'net/http'
    require 'json'

    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=77002&distance=0&API_KEY=99E9ED51-A513-482D-AA3E-93162D184126'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    # Check for empty result
    if @output.empty?
      @final_output = "Errore!"
    elsif !@output
      @final_output = "Errore!"
    else
      @final_output = @output[0]['AQI']
    end

    if @final_output == "Errore!"
      @api_color = "turquoise"
    elsif @final_output <= 50
      @api_color = "green"
      @api_description = "Aria soddisfacente!"
    elsif @final_output >= 51 && @final_output <= 100
      @api_color = "yellow"
      @api_description = "Aria mediocre!"
    elsif @final_output >= 101 && @final_output <= 150
      @api_color = "orange"
      @api_description = "Aria pesante!"
    elsif @final_output >= 151 && @final_output <= 200
      @api_color = "red"
      @api_description = "Aria molto pesante!"
    elsif @final_output >= 201 && @final_output <= 300
      @api_color = "purple"
      @api_description = "Aria possibilemente da evitare!"
    elsif @final_output >= 301 && @final_output <= 500
      @api_color = "maroon" 
      @api_description = "Aria da evitare tutti!"
    end




    end
  end

end
