# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130322050849) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.text     "content"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "rendered_content"
  end

  create_table "change_logs", :force => true do |t|
    t.integer  "version",                      :null => false
    t.integer  "record_id"
    t.string   "table_name",     :limit => 60
    t.string   "attribute_name", :limit => 60
    t.string   "user",           :limit => 20
    t.string   "action",         :limit => 6
    t.text     "old_value"
    t.text     "new_value"
    t.string   "field_type",     :limit => 30
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "model_name"
  end

  create_table "cities_moderators", :id => false, :force => true do |t|
    t.integer "moderator_id"
    t.integer "city_id"
  end

  create_table "cities_tickets", :id => false, :force => true do |t|
    t.integer "ticket_id"
    t.integer "city_id"
  end

  add_index "cities_tickets", ["ticket_id", "city_id"], :name => "index_cities_tickets_on_ticket_id_and_city_id", :unique => true

  create_table "contact_messages", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "documents", :force => true do |t|
    t.string   "name"
    t.string   "attach_file_name"
    t.string   "attach_content_type"
    t.integer  "attach_file_size"
    t.datetime "attach_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.text     "description"
    t.integer  "position"
  end

  create_table "email_templates", :force => true do |t|
    t.string   "name"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hotel_bank_attributes", :force => true do |t|
    t.integer "hotel_id"
    t.string  "name"
    t.string  "bik"
    t.string  "corr_account"
    t.string  "current_account"
  end

  add_index "hotel_bank_attributes", ["hotel_id"], :name => "index_hotel_bank_attributes_on_hotel_id"

  create_table "hotel_bookings", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hotel_cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "position"
  end

  create_table "hotel_filter_items", :force => true do |t|
    t.integer  "filter_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "hotel_filter_items", ["filter_id"], :name => "index_hotel_filter_items_on_filter_id"

  create_table "hotel_filter_values", :force => true do |t|
    t.integer "filter_id"
    t.integer "hotel_id"
    t.integer "item_id"
  end

  add_index "hotel_filter_values", ["filter_id"], :name => "index_hotel_filter_values_on_filter_id"
  add_index "hotel_filter_values", ["hotel_id"], :name => "index_hotel_filter_values_on_hotel_id"
  add_index "hotel_filter_values", ["item_id"], :name => "index_hotel_filter_values_on_item_id"

  create_table "hotel_filters", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "position"
    t.boolean  "show_in_search"
    t.boolean  "include_to_print", :default => false
  end

  create_table "hotel_images", :force => true do |t|
    t.integer  "hotel_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "description"
    t.string   "attach_file_name"
    t.string   "attach_content_type"
    t.integer  "attach_file_size"
    t.datetime "attach_updated_at"
  end

  add_index "hotel_images", ["hotel_id"], :name => "index_hotel_images_on_hotel_id"

  create_table "hotel_reviews", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "ip"
    t.text     "text"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "published",    :default => false
    t.integer  "hotel_id"
    t.integer  "character_id"
  end

  add_index "hotel_reviews", ["hotel_id"], :name => "index_hotel_reviews_on_hotel_id"

  create_table "hotel_room_field_values", :force => true do |t|
    t.integer "field_id"
    t.integer "room_id"
    t.string  "value"
  end

  add_index "hotel_room_field_values", ["field_id"], :name => "index_hotel_room_field_values_on_field_id"

  create_table "hotel_room_fields", :force => true do |t|
    t.string  "name"
    t.string  "default_value"
    t.boolean "only_signed"
    t.boolean "multiline"
    t.boolean "include_to_print"
    t.integer "position"
  end

  create_table "hotel_room_list_items", :force => true do |t|
    t.integer  "list_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hotel_room_list_values", :force => true do |t|
    t.integer  "room_id"
    t.integer  "list_id"
    t.integer  "item_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hotel_room_lists", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hotel_room_photos", :force => true do |t|
    t.integer  "room_id"
    t.string   "attach_file_name"
    t.string   "attach_content_type"
    t.integer  "attach_file_size"
    t.datetime "attach_updated_at"
    t.string   "description"
  end

  create_table "hotel_room_types", :force => true do |t|
    t.string "name"
  end

  create_table "hotel_rooms", :force => true do |t|
    t.integer  "hotel_id"
    t.string   "name"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "all_count"
    t.string   "area"
    t.integer  "price_summer_from"
    t.integer  "price_summer_to"
    t.integer  "price_high_season_from"
    t.integer  "price_high_season_to"
    t.integer  "price_winter_from"
    t.integer  "price_winter_to"
    t.integer  "type_id"
    t.integer  "places_count"
    t.integer  "additional_places_count"
  end

  add_index "hotel_rooms", ["type_id"], :name => "index_hotel_rooms_on_type_id"

  create_table "hotel_service_values", :force => true do |t|
    t.integer  "service_id"
    t.integer  "hotel_id"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hotel_services", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.boolean  "default"
    t.string   "default_value"
    t.boolean  "only_signed"
    t.boolean  "multiline"
    t.integer  "position"
    t.boolean  "include_to_print"
    t.integer  "filter_item_id"
    t.boolean  "only_moderator"
  end

  create_table "hotel_special_offers", :force => true do |t|
    t.integer  "hotel_id"
    t.date     "from"
    t.date     "to"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "title"
  end

  create_table "hotel_streets", :force => true do |t|
    t.string "name"
  end

  create_table "hotel_types", :force => true do |t|
    t.string "name"
  end

  create_table "hotels", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "reviews_count",        :default => 0
    t.integer  "city_id"
    t.string   "phone"
    t.string   "email"
    t.string   "site"
    t.text     "route_description"
    t.string   "iin"
    t.string   "kpp"
    t.string   "ogrn"
    t.string   "legal_address"
    t.string   "post_address"
    t.string   "street_number"
    t.string   "way_file_name"
    t.string   "way_content_type"
    t.integer  "way_file_size"
    t.datetime "way_updated_at"
    t.integer  "booking_id"
    t.string   "booking_description"
    t.boolean  "published"
    t.integer  "street_id"
    t.integer  "min_age_children",     :default => 0
    t.text     "adjacent_territory"
    t.integer  "min_price_winter",     :default => 0
    t.integer  "min_price_summer",     :default => 0
    t.string   "checkout_time"
    t.string   "documents"
    t.integer  "agency_commission",    :default => 0
    t.integer  "rooms_count",          :default => 0
    t.integer  "images_count",         :default => 0
    t.integer  "all_rooms_count",      :default => 0
    t.integer  "special_offers_count", :default => 0
    t.float    "map_latitude"
    t.float    "map_longitude"
    t.string   "street"
  end

  create_table "hotels_bank_attributes", :force => true do |t|
    t.integer "hotel_id"
    t.string  "name"
    t.string  "bik"
    t.string  "corr_account"
    t.string  "current_account"
  end

  create_table "mercury_images", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "ticket_id"
    t.text     "text"
    t.boolean  "edited"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "messages", ["ticket_id"], :name => "index_messages_on_ticket_id"
  add_index "messages", ["user_id"], :name => "index_messages_on_user_id"

  create_table "messages_have_read_users", :id => false, :force => true do |t|
    t.integer "message_id"
    t.integer "user_id"
  end

  add_index "messages_have_read_users", ["message_id", "user_id"], :name => "index_messages_have_read_users_on_message_id_and_user_id", :unique => true

  create_table "messages_users", :force => true do |t|
    t.integer "user_id"
    t.integer "message_id"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "alias"
    t.text     "content"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "profile_notes", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "user_id"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.string   "phones"
    t.string   "skype"
    t.string   "icq"
    t.string   "company_name"
    t.string   "address"
    t.string   "agreement"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "user_id"
    t.text     "description"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean  "notified",          :default => true
    t.string   "city"
    t.date     "validity"
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "rooms_tickets", :id => false, :force => true do |t|
    t.integer "ticket_id"
    t.integer "room_id"
  end

  create_table "rooms_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "room_id"
  end

  add_index "rooms_users", ["user_id", "room_id"], :name => "index_rooms_users_on_user_id_and_room_id", :unique => true

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "simple_captcha_data", ["key"], :name => "idx_key"

  create_table "tickets", :force => true do |t|
    t.integer  "agency_id"
    t.integer  "moderator_id"
    t.integer  "message_id"
    t.boolean  "closed"
    t.integer  "messages_count"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.integer  "admin_new_messages_count",  :default => 0
    t.integer  "agency_new_messages_count", :default => 0
    t.datetime "last_message_created_at"
    t.string   "company_name"
    t.integer  "closer_id"
    t.integer  "camper_id"
    t.integer  "camper_new_messages_count", :default => 0
  end

  add_index "tickets", ["agency_id"], :name => "index_tickets_on_agency_id"
  add_index "tickets", ["camper_id"], :name => "index_tickets_on_camper_id"
  add_index "tickets", ["message_id"], :name => "index_tickets_on_message_id"
  add_index "tickets", ["moderator_id"], :name => "index_tickets_on_admin_id"

  create_table "tickets_hotel_cities", :id => false, :force => true do |t|
    t.integer "ticket_id"
    t.integer "city_id"
  end

  create_table "user_admin_profiles", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "fax"
    t.string   "skype"
    t.string   "contract_number"
    t.integer  "admin_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "user_hotelier_hotels", :force => true do |t|
    t.integer  "user_id"
    t.integer  "hotel_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "hotel_name"
  end

  add_index "user_hotelier_hotels", ["hotel_id"], :name => "by_hotel"
  add_index "user_hotelier_hotels", ["user_id"], :name => "by_user"

  create_table "users", :force => true do |t|
    t.string   "email",                   :default => "",   :null => false
    t.string   "encrypted_password",      :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.integer  "failed_attempts",         :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "role"
    t.string   "type"
    t.boolean  "is_partner"
    t.integer  "new_messages_count"
    t.boolean  "save_hotel_search_query", :default => true
    t.text     "hotel_search_query",      :default => ""
    t.boolean  "is_hotelier"
    t.boolean  "is_tourist"
    t.string   "surname"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
