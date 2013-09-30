module TagsHelper
  def progress_bar(progress, css_class = '', options = {})
    %Q[<div class="progress" #{data_attributes(options[:data])}>
  <div class="progress-bar #{css_class}" role="progressbar" aria-valuenow="#{progress}" aria-valuemin="0" aria-valuemax="100" style="width: #{progress}%;">
    <span class="sr-only">#{progress}% Hotovo</span>
  </div>
</div>].html_safe
  end

  def data_attributes(data)
    if data
      data.map { |key, value| %{data-#{key}="#{value}"} }.join(' ')
    end
  end
end
