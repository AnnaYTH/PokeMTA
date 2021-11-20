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

bundle exec rails db:create
    Created database 'pokeMTA_development'
    Created database 'pokeMTA_test'

<form action="<%= session_url %>" method="POST">
<%= auth_token %>

WHENEVER I HAVE A FORM 
Tashi's logged in button
<% if logged_in? %>
      <h2> Welcome <%= current_user.email %> </h2>
      <form action="<%= session_url %>" method="POST">
        <input type="hidden" name="_method" value="DELETE">
        <%= auth_token %>
        <input type="submit" value="Logout">
    <% else %>
      <a class="link" href="<%= new_session_url %>"> Login </a>
      <br>
      <a class="link" href="<%= new_user_url %>"> Sign up </a>
    <% end %>