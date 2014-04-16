class AppDelegate < PM::Delegate

  def on_load(app, options)
    set_default_appearance

    #open_tab_bar NiceScreen.new, HomeScreen.new(nav_bar: true), ForecastScreen.new(nav_bar: true)
    open_tab_bar HomeScreen.new(nav_bar: true), ForecastScreen.new(nav_bar: true)
  end

  def set_default_appearance
    nav_bar = UINavigationBar.appearance
    nav_bar.setBarStyle UIBarStyleBlack
    nav_bar.setBarTintColor "#15adca".to_color
    nav_bar.setTintColor UIColor.whiteColor
    nav_bar.setTitleTextAttributes({
                                       UITextAttributeTextColor => UIColor.whiteColor
                                   })
  end
end