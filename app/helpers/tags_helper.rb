module TagsHelper
  def progress_bar(progress, css_class = '')
    %Q[<div class="progress">
  <div class="progress-bar #{css_class}" role="progressbar" aria-valuenow="#{progress}" aria-valuemin="0" aria-valuemax="100" style="width: #{progress}%;">
    <span class="sr-only">#{progress}% Hotovo</span>
  </div>
</div>].html_safe
  end
end
