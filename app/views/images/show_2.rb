
<%= image_tag @image.url %>

<%= form_for [@image, @comment] do |form| %>
  <%= form.label :comment, "Comment" %>
  <%= form.text_field :comment "Place your comment here" %>
  <%= form.submit "Submit" %>

<% end %>
