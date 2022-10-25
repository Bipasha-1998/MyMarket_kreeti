# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...





                  <li class="nav-item">
          <%= link_to current_user.username, user_path(current_user), class: 'nav-link' %>
          </li>



In application_controller.rb

    def require_admin
        if !is_admin?
            flash[:alert] = "You are not authorized to perform these actions"
        end
    end



    In omniauth action
          user = User.from_omniauth(request.env['omniauth.auth'])
      if user.valid?
        session[:user_id] = user.id
        redirect to user_path(user)
      else
        redirect_to '/login'
      end



<%= link_to 'New conversation', new_conversation_path, class: 'btn btn-primary', id: 'new-chat-btn' %>

      <%= render 'new_conversation_form' %>



In _navigation.html.erb
<%= form_tag(search_path, method: "get", remote: true, class: "d-flex search-form", role: "search") do %>
        <div class="col-7">
          <%= text_field_tag :search, "", class: "form-control me-2", placeholder: "Search", onkeydown: "clickSubmit()" %>
        </div>
        <%= select_tag "", options_for_select(@categories.collect { |cat| [cat.name, cat.id]}), class: "custom-select" %>
        <%= submit_tag "Search", class: "btn btn-outline-success",id: "search-submit" %>
      <% end %>


              <%= text_field_tag(:search), class: 'form-control me-2', placeholder: 'Search' %>




def self.search(search)
    if search
        where(["name LIKE ?", "%#{search}%"])
    else
        all
    end
end


<% if obj.errors.any? %>
    <div>
        <% obj.errors.full_messages.each do |msg| %>
            <div class="alert alert-danger"><%= msg %></div>
        <% end %>
    </div>
<% end %>

<div class="text-center">
                <%= link_to "Log in with Google", '/auth/google_oauth2', method: :post, class: "btn btn-outline-success"  %>
            </div>




    config.middleware.insert_before ActionDispatch::Static, Rack::Cors do
      allow do
        origins 'http://localhost:3000'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end

    config.action_dispatch.default_headers = {
    'Access-Control-Allow-Origin' => 'http://localhost:3000',
    'Access-Control-Allow-Credentials' => true,
    'Access-Control-Request-Method' => 'GET, POST, OPTIONS',
    'Access-Control-Allow-Headers:' => 'Origin, X-Api-Key, X-Requested-With, Content-Type, Accept, Authorization'

    }







       