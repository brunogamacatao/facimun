class StarRatingInput < SimpleForm::Inputs::Base
  def input
    out = ''
    
    10.times do |i|
      out << @builder.radio_button(attribute_name, i.to_s, :class => 'star')
    end
    
    out.html_safe
  end
end