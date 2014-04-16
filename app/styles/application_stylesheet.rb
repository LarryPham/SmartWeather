class ApplicationStylesheet < RubyMotionQuery::Stylesheet
  PADDING = 3

  def application_setup
    font_family = 'Helvetica Neue'
    font.add_named :medium,     font_family, 16
    font.add_named :small,      font_family, 14
    font.add_named :tiny,       font_family, 12
    font.add_named :itty_bitty, font_family, 8

    color.add_named :sky_blue,   '#15adca'
  end

  def label(st)
    st.background_color = color.clear
  end
end
