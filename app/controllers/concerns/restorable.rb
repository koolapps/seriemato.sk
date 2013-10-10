module Restorable
  extend ActiveSupport::Concern

  included do
    before_filter :restore_user_data, only: [:new]
    before_filter :save_user_data, only: [:create, :update]
  end

  private

  def save_user_data
    if resource.valid?
      attributes_to_save.each do |attribute|
        cookies[cookie_name(attribute)] = { value: resource.send(attribute), expires: 3.months.from_now }
      end
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
