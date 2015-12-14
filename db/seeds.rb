# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

collections = [
  {:name => "Models", :user_id => 1},
  {:name => "Controllers", :user_id => 1},
  {:name => "Ajax", :user_id => 1},
  {:name => "Views", :user_id => 1},
  {:name => "OOJS", :user_id => 1},
  {:name => "My Top Code Samples", :user_id => 1},
  {:name => "BCrypt", :user_id => 1},
  {:name => "CRUD", :user_id => 1},
  {:name => "Constructor Function Practice", :user_id => 1},
  {:name => "Miscellaneous", :user_id => 1}
]

Collection.create!(collections)


code_snippets = [
  {:code_url => "https://github.com/adyrda2/github_oauth_example/blob/13015b872966112b45bd933a776c7051de301c2d/app/models/README.md", :code_content => "var map;
  function initMap(){map = new google.maps.Map(document.getElementById('map'),{
  zoom: 4, center: {lat: -28, lng: 137}
  });", :collection_id => 1 },
  {:code_url => "https://github.com/adyrda2/github_oauth_example/blob/13015b872966112b45bd933a776c7051de301c2d//Rakefile", :code_content =>"var map;
  function initMap(){map = new google.maps.Map(document.getElementById('map'),{
  zoom: 4, center: {lat: -28, lng: 137}
  });", :collection_id => 1 },
  {:code_url => "https://github.com/adyrda2/github_oauth_example/blob/13015b872966112b45bd933a776c7051de301c2d/config/database.rb", :code_content => "var map;
  function initMap(){map = new google.maps.Map(document.getElementById('map'),{
  zoom: 4, center: {lat: -28, lng: 137}
  });", :collection_id => 2 },
  {:code_url => "https://github.com/adyrda2/github_oauth_example/blob/13015b872966112b45bd933a776c7051de301c2d/spec/band_spec.rb", :code_content => "var map;
  function initMap(){map = new google.maps.Map(document.getElementById('map'),{
  zoom: 4, center: {lat: -28, lng: 137}
  });", :collection_id => 2 },
  {:code_url => "https://github.com/adyrda2/phase-0-gps-1/blob/0ad4af3132ff281fcc65d363146c2b089933c6fa//awesome_page.md", :code_content => "var map;
  function initMap(){map = new google.maps.Map(document.getElementById('map'),{
  zoom: 4, center: {lat: -28, lng: 137}
  });", :collection_id => 3 },
  {:code_url => "https://github.com/adyrda2/adyrda2.github.io/blob/f79e74701cf4a7a17fa7270e10d4e788f530e224/blog/t2-css-design.html", :code_content => "var map;
  function initMap(){map = new google.maps.Map(document.getElementById('map'),{
  zoom: 4, center: {lat: -28, lng: 137}
  });", :collection_id => 4 },
  {:code_url => "https://github.com/adyrda2/adyrda2.github.io/blob/f79e74701cf4a7a17fa7270e10d4e788f530e224//index.html", :code_content => "var map;
  function initMap(){map = new google.maps.Map(document.getElementById('map'),{
  zoom: 4, center: {lat: -28, lng: 137}
  });", :collection_id => 7 },
  {:code_url => "https://github.com/adyrda2/adyrda2.github.io/blob/f79e74701cf4a7a17fa7270e10d4e788f530e224/blog/t7-Javascript.html", :code_content => "var map;
  function initMap(){map = new google.maps.Map(document.getElementById('map'),{
  zoom: 4, center: {lat: -28, lng: 137}
  });", :collection_id => 8 },
]

CodeSnippet.create!(code_snippets)
