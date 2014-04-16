#class NiceScreen < ProMotion::Screen
#
#  WIDTH = 250
#
#  def on_load
#
#    rmq.stylesheet = WindsStylesheet
#
#    set_attributes self.view, {
#        background_color: hex_color("FFFFFF")
#    }
#
#    @text = UILabel.alloc.init
#    rmq(@text).apply_style(:logo)
#    rmq(@text).layout(left: 30, top: 20, width: WIDTH, height: 50)
#    @text.text = "Palaiseau"
#    @text.textColor = UIColor.blackColor
#    self.view.addSubview(@text)
#
#    @text = UILabel.alloc.init
#    rmq(@text).apply_style(:logo)
#    rmq(@text).layout(left: 150, top: 20, width: 48, height: 50)
#    @text.text = "IMAGE"
#    @text.textColor = UIColor.blackColor
#    self.view.addSubview(@text)
#
#    @text = UILabel.alloc.init
#    rmq(@text).layout(left: 20, top: 80, width: WIDTH, height: 50)
#    rmq(@text).apply_style(:logo)
#    @text.text = "Le ciel sera claire toute la journée."
#    @text.textColor = UIColor.blackColor
#    self.view.addSubview(@text)
#
#    @text = UILabel.alloc.init
#    rmq(@text).layout(left: 20, top: 140, width: WIDTH, height: 50)
#    @text.text = "Palaiseau"
#    @text.textColor = UIColor.blackColor
#    self.view.addSubview(@text)
#
#    @text = UILabel.alloc.init
#    rmq(@text).layout(left: 20, top: 200, width: WIDTH, height: 50)
#    @text.text = "Palaiseau"
#    @text.textColor = UIColor.blackColor
#    self.view.addSubview(@text)
#
#  end
#
#  def will_present
#    # Only fires if pushing this screen onto a UINavigationController
#  end
#
#  def will_appear
#  end
#
#  def on_appear
#  end
#
#  def will_disappear
#  end
#
#  def on_disappear
#  end
#
#  def will_dismiss
#  end
#
#  def on_dismiss
#  end
#
#  # custom method, triggered by tapping right nav bar button
#  def go_to_next
#    open NextScreen
#  end
#
#end
