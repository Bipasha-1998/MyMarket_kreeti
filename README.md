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

*** product model ***
scope :filter_by_title, ->(title) { where('lower    title) LIKE ?', "%#{title}%") }
scope :filter_by_category, ->(category_id) { where category_id: category_id }
scope :filter_by_city, ->(city) { where('lower(city) LIKE ?', "%#{city}%") }


*** product controller ***
@products = @products.filter_by_city(params[:city].downcase) if params[:city].present?
    @products = @products.filter_by_title(params[:title].downcase) if params[:title].present?
    @products = @products.filter_by_category(params[:category]) if params[:category].present?  