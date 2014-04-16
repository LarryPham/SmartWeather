class HomeScreen < ProMotion::TableScreen
  include Helper

  title "Maintenant"
  tab_bar_item title: "Maintenant", icon: "temp"

  refreshable callback: :on_refresh,
              pull_message: "Pull to refresh",
              refreshing: "Refreshing data…",
              updated_format: "Last updated at %s",
              updated_time_format: "%l:%M %p"

  def on_load
    rmq.stylesheet = WindsStylesheet

    view.rmq.apply_style :root_view
    table_view.rmq.apply_style :gradient_table

    set_nav_bar_right_button 'flag'.uiimage
    set_nav_bar_left_button 'settings'.uiimage, action: :open_about

    load_table
  end

  def load_table
    BW::Location.get_once do |location|
      BW::HTTP.get("http://api.openweathermap.org/data/2.5/weather?lat=#{location.latitude.to_s}&lon=#{location.longitude}") do |response|
        @data = []
        json = BW::JSON.parse(response.body.to_str)
        #json.each_with_index do |hash, i|
          @data = home_cell(json).flatten
          update_table_data
        #end
      end
      update_table_data
      end_refreshing
    end
  end

  def home_cell(json)
    [
      { title: json["name"], background_color: cell_background_color(0), height: 50, masks_to_bounds: true, selection_style: UITableViewCellSelectionStyleBlue, cell_class: WindCell, image: "location".uiimage  },
      { title: "#{kelvin_to_format(json['main']['temp']).to_s} #{unit}", background_color: cell_background_color(1), height: 50, masks_to_bounds: true, selection_style: UITableViewCellSelectionStyleBlue, cell_class: WindCell, image: "temp".uiimage },
      { title: "#{kelvin_to_format(json['main']['temp_min']).to_s} #{unit}", background_color: cell_background_color(2), height: 50, masks_to_bounds: true, selection_style: UITableViewCellSelectionStyleBlue, cell_class: WindCell, image: "tempmin".uiimage },
      { title: "#{kelvin_to_format(json['main']['temp_max']).to_s} #{unit}", background_color: cell_background_color(3), height: 50, masks_to_bounds: true, selection_style: UITableViewCellSelectionStyleBlue, cell_class: WindCell, image: "tempmax".uiimage },
      { title: "#{json['main']['pressure'].to_s} hPa", background_color: cell_background_color(4), height: 50, masks_to_bounds: true, selection_style: UITableViewCellSelectionStyleBlue, cell_class: WindCell, image: "flag".uiimage },
      { title: "#{mph_to_kmh(json['wind']['speed']).to_s} kmh", background_color: cell_background_color(5), height: 50, masks_to_bounds: true, selection_style: UITableViewCellSelectionStyleBlue, cell_class: WindCell, image: "flag".uiimage },
      { title: "#{mph_to_kmh(json['wind']['gust']).to_s} kmh", background_color: cell_background_color(6), height: 50, masks_to_bounds: true, selection_style: UITableViewCellSelectionStyleBlue, cell_class: WindCell, image: "flag".uiimage },
      { title: "#{json['wind']['deg'].to_s}°", background_color: cell_background_color(7), height: 50, masks_to_bounds: true, selection_style: UITableViewCellSelectionStyleBlue, cell_class: WindCell, image: "flag".uiimage },
    ]
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
