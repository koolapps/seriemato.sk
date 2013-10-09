module Restorable
  private

  def save_user_data
    attributes_to_save.each do |attribute|
      cookies[cookie_name(attribute)] = { value: resource.send(attribute), expires: 3.months.from_now }
    end
  end

  def restore_user_data
    attributes_to_save.each do |attribute|
      resource.send("#{attribute}=", cookies[cookie_name(attribute)])
    end
  end

  def resource
    raise NotImplementedError, 'Restorables must implement #resource'
  end

  def attributes_to_save
    raise NotImplementedError, 'Restorables must implement #attributes_to_save'
  end

  def cookie_name(attribute)
    "#{resource.class.name.downcase}_#{attribute}"
  end
end
