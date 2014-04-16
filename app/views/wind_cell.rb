class WindCell < PM::TableViewCell
  attr_accessor :azimuth, :pressure, :humidity, :temperature, :wind_speed, :infos, :date

  # This method is used by ProMotion to instantiate cells.
  def initWithStyle(style_name, reuseIdentifier: reuseIdentifier)
    super
    @wind_speed       = rmq.append(UILabel)
    @pressure        = rmq.append(UILabel)
    @humidity          = rmq.append(UILabel)
    @temperature    = rmq.append(UILabel)
    @infos = rmq.append(UILabel)
    @date = rmq.append(UILabel)
    self
  end

  # Apply the styles once the cell is at the proper height
  def layoutSubviews
    super # Remove this call to not draw the title and subtitle elements.

    @wind_speed.apply_style(:wind_speed)
    @pressure.apply_style(:pressure)
    @humidity.apply_style(:humidity)
    @temperature.apply_style(:temperature)
    @infos.apply_style(:infos)
    @date.apply_style(:date)
  end

  def wind_speed= a
    @wind_speed.get.text = a
  end

  def humidity= s
    @humidity.get.text = s
  end

  def temperature= t
    @temperature.get.text = (t == '') ? '--' : t
  end

  def infos= i
    @infos.get.text = i
  end

  def date= i
    @date.get.text = i
  end

  def pressure= b
    if b.nil?
      @pressure.get.text = ''
      return
    end

    @pressure.get.text = "#{b}"
  end
end
