# encoding: utf-8

module ProfilesHelper
  def protected_text_field f, name, options = {}
    if f.object.can_change? name
      f.text_field name, options
    else
      f.wrapper name, hint: 'Для изменения этого поля, обратитесь к администратору' do
        text_field_tag(name, f.object[name], disabled: true)
      end
    end
  end
end
