class WindsStylesheet < ApplicationStylesheet

  PRESSURE_HEIGHT = 10
  WIND_SPEED_WIDTH = 70
  LABEL_WIDTH    = 100

  def root_view(st)
  end

  def gradient_table(st)
    st.separator_style = :none
    st.content_inset = UIEdgeInsetsMake(0, 0, -50, 0)
  end

  def wind_speed(st)
    st.font = font.tiny
    st.text_alignment = :center

    st.height = 10
    st.width  = 100
    st.left        = 110
    st.from_bottom = 6
  end

  def pressure(st)
    st.font = font.tiny
    st.text_alignment = :center

    st.height = 10
    st.width  = 100
    st.left        = 37
    st.from_bottom = 6
  end

  def humidity(st)
    st.font = font.tiny
    st.text_alignment = :center

    st.height = 10
    st.width  = 90
    st.left        = 176
    st.from_bottom = 6
  end

  def temperature(st)
    left = (PADDING * 20) + PADDING + LABEL_WIDTH + PADDING

    st.frame = {
      l: left,
      t: -10,
      w: LABEL_WIDTH,
      h: st.super_height + 25
    }
    st.font = font.medium
    st.text_alignment = :left
  end

  def infos(st)
    st.font = font.small
    st.text_alignment = :center

    st.frame = {
      l: 3,
      t: 3,
      w: 1000,
      h: st.super_height + 25
    }

    st.padded = {left: 55, top: -2}

    st.font = font.medium
    st.text_alignment = :left
  end

  def date(st)
    st.font = font.small
    st.text_alignment = :center

    st.frame = {
      l: 3,
      t: 3,
      w: 800,
      h: st.super_height + 25
    }

    st.padded = {left: 55, top: -40}

    st.font = font.medium
    st.text_alignment = :left
  end

  def logo(st)
    st.centered = :horizontal
    st.font = font.medium
  end
end
