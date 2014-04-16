class ForecastScreen < ProMotion::TableScreen
  include Helper

  title "Prévision"
  tab_bar_item title: "Prévision", icon: "list"

  refreshable callback: :on_refresh,
              pull_message: "Pull to refresh",
              refreshing: "Refreshing data…",
              updated_format: "Last updated at %s",
              updated_time_format: "%l:%M %p"

  def on_load
    rmq.stylesheet = WindsStylesheet

    table_view.rmq.apply_style :gradient_table

    set_nav_bar_right_button 'flag'.uiimage
    set_nav_bar_left_button 'settings'.uiimage, action: :open_about

    load_table
  end

  def load_table
    BW::Location.get_once do |location|
      BW::HTTP.get("http://api.openweathermap.org/data/2.5/forecast?lat=#{location.latitude}&lon=#{location.longitude}") do |response|
        @data = []
        json = BW::JSON.parse(response.body.to_str)
        json["list"].each_with_index do |hash, i|
          @data << forecast_cell(hash, i)
          update_table_data
        end
      end
    end
    update_table_data
    end_refreshing
  end

  def forecast_cell(hash, i)
    {
      background_color: cell_background_color(i),
      height: 90,
      masks_to_bounds: true,
      infos: translate(hash['weather'].first['description']).capitalize,
      pressure: "#{hash['main']['pressure'].round(2)} hPa".to_s,
      humidity: "#{hash['main']['humidity'].round(2)} %".to_s,
      temperature: "#{ kelvin_to_format(hash['main']['temp']).to_s } #{unit} ",
      wind_speed: "#{mph_to_kmh(hash['wind']['speed'])} km/h".to_s,
      image: load_image(hash['weather'].first['description']),
      date: Time.at(hash["dt"]).strftime("Le %-d %B %Y à %H:%M").to_s,
      selection_style: UITableViewCellSelectionStyleBlue,
      cell_class: WindCell
    }
  end


  def table_data
    [
        {
            cells: @data.nil? ? [] : @data
        }
    ]
  end

  def on_refresh
    load_table
  end

  def open_about
    open AboutScreen
  end

end
