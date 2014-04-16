module Helper

  def cell_background_color(index)
    if index >= 8
      "ffffff".to_color
    else
      %w(18c1e0 29cae9 40d0eb 57d6ed 6edbf0 85e1f2 9ce7f4 b3ecf7 caf2f9)[index].to_color
    end
  end

  def kelvin_to_format(k)
    if App::Persistence["unit"] == "Celcius"
      (k-273.15).round(2)
    else
      ((k*9/5)-459.67).round(2)
    end
  end

  def mph_to_kmh(mph)
    (mph*1.852).round(2)
  end

  def unit
    if App::Persistence["unit"] == "Celcius"
      "°C"
    else
      "°F"
    end
  end

  def load_image(str)
    case str
      when "scattered clouds"
        'suncloud'.uiimage
      when "sky is clear"
        'sun'.uiimage
      when "few clouds"
        'suncloud'.uiimage
      when "overcast clouds"
        'suncloud'.uiimage
      when "broken clouds"
        'suncloud'.uiimage
      when "snow"
        'snow'.uiimage
      when "moderate rain"
        'raincloud'.uiimage
      when "shower rain"
        'raincloud'.uiimage
      when "heavy intensity shower rain"
        'raincloud'.uiimage
      when "ragged shower rain"
        'raincloud'.uiimage
      when "drizzle"
        'raincloud'.uiimage
      when "light snow"
        'snow'.uiimage
      else
        'rain'.uiimage
      #Calm
      #Light breeze
      #Gentle Breeze
      #Moderate breeze
      #Fresh Breeze
      #Strong breeze
      #High wind, near gale
      #Gale
      #Severe Gale
      #Storm
      #Violent Storm
      #Hurricane
      #tornado
      #tropical storm
      #hurricane
      #cold
      #hot
      #windy
      #hail
      #light snow
      #snow
      #heavy snow
      #sleet
      #shower sleet
      #light rain and snow
      #rain and snow
      #light shower snow
      #shower snow
      #heavy shower snow
      #heavy intensity rain
      #very heavy rain
      #extreme rain
      #freezing rain
      #light intensity shower rain
      #shower rain
      #heavy intensity shower rain
      #ragged shower rain
      #light intensity drizzle
      #drizzle
      #heavy intensity drizzle
      #light intensity drizzle rain
      #drizzle rain
      #heavy intensity drizzle rain
      #shower rain and drizzle
      #heavy shower rain and drizzle
      #shower drizzle
      #thunderstorm with light rain
      #thunderstorm with rain
      #thunderstorm with heavy rain
      #light thunderstorm
      #thunderstorm
      #heavy thunderstorm
      #ragged thunderstorm
      #thunderstorm with light drizzle
      #thunderstorm with drizzle
      #thunderstorm with heavy drizzle
    end
  end

  def translate(str)
    if App::Persistence['language'] == 'Français'
      case str
        when "scattered clouds"
          'nuageux'
        when "sky is clear"
          'beau temps'
        when "few clouds"
          'légèrement nuageux'
        when "overcast clouds"
          'ciel couvert'
        when "broken clouds"
          'nuages dispersés'
        when "snow"
          'neige'
        when "moderate rain"
          'pluie modérée'
        when "shower rain"
          'pluie'
        when "heavy intensity shower rain"
          'pluie intense'
        when "drizzle"
          'crachin'
        when "light snow"
          'neige'
        else
          str
      end
    else
      str
    end
  end
end