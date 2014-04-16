class AboutScreen < Formotion::FormController
  include BW::KVO

  def init
    @form ||= Formotion::Form.new({
                                      sections: [{
                                                     title: 'Settings:',
                                                     rows: [{
                                                                title: 'Unité',
                                                                subtitle: "Celcius ou Farenheit",
                                                                key: :unit,
                                                                type: :picker,
                                                                value: App::Persistence['unit'],
                                                                items: ["Celcius", "Farenheit"],
                                                                input_accessory: :done
                                                            },
                                                            {
                                                                title: 'Language',
                                                                subtitle: "Choisissez votre langue",
                                                                key: :language,
                                                                type: :picker,
                                                                value: App::Persistence['language'],
                                                                items: ["Français", "English", "Spanish"],
                                                                input_accessory: :done
                                                            }]
                                                },{
                                                     title: "Partager l'application",
                                                     rows: [{
                                                                title: 'Partager',
                                                                subtitle: 'SMS, Email, Tweet, or Facebook!',
                                                                type: :share,
                                                                image: 'share',
                                                                value: {
                                                                    items: "I'm using the '#{App.name}' app ! Check it out! http://www.actupolitiqueapp.com/",
                                                                    excluded: excluded_services
                                                                }
                                                            }, {
                                                                title: "Notez #{App.name} sur iTunes",
                                                                type: :rate_itunes,
                                                                image: 'itunes'
                                                            }]
                                                 },
                                                 {
                                                     title: "A propos #{App.name}:",
                                                     rows: [{
                                                                title: 'Version',
                                                                type: :static,
                                                                placeholder: App.info_plist['CFBundleShortVersionString'],
                                                                selection_style: :none
                                                            },
                                                            {
                                                                title: 'Copyright',
                                                                type: :static,
                                                                font: { name: 'HelveticaNeue', size: 14 },
                                                                placeholder: '© 2014, Nicolas RENARD',
                                                                selection_style: :none
                                                            },
                                                            {
                                                                title: 'Fait avec ♥ en Essonne',
                                                                type: :static,
                                                                enabled: false,
                                                                selection_style: :none,
                                                                text_alignment: NSTextAlignmentCenter
                                                            }]
                                                 }]

                                  })
    super.initWithForm(@form)
  end

  def viewDidLoad
    super
    self.title = 'Paramètres'
    #self.navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemStop, target:self, action:'close')
    observe_switces
  end

  def close
    dismissModalViewControllerAnimated(true)
  end

  def excluded_services
    [
        UIActivityTypeAddToReadingList,
        UIActivityTypeAirDrop,
        UIActivityTypeCopyToPasteboard,
        UIActivityTypePrint
    ]
  end

  def observe_switces
    unit = @form.sections[0].rows[0]
    language = @form.sections[0].rows[1]

    observe(unit, 'value') do |old_value, new_value|
      flurry_params = {on_off: new_value}
      App::Persistence['unit'] = new_value
    end

    observe(language, 'value') do |old_value, new_value|
      flurry_params = {on_off: new_value}
      App::Persistence['language'] = new_value
    end
  end

end