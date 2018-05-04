# == Route Map
#
#                   Prefix Verb   URI Pattern                    Controller#Action
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session GET    /users/sign_out(.:format)      devise/sessions#destroy
#            user_password POST   /users/password(.:format)      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                          PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#        user_registration POST   /users(.:format)               devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#                          PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#                    infos GET    /infos(.:format)               infos#index
#                          POST   /infos(.:format)               infos#create
#                 new_info GET    /infos/new(.:format)           infos#new
#                edit_info GET    /infos/:id/edit(.:format)      infos#edit
#                     info PATCH  /infos/:id(.:format)           infos#update
#                          PUT    /infos/:id(.:format)           infos#update
#                          DELETE /infos/:id(.:format)           infos#destroy
#             preview_item GET    /items/:id/preview(.:format)   items#preview
#                    items GET    /items(.:format)               items#index
#                          POST   /items(.:format)               items#create
#                 new_item GET    /items/new(.:format)           items#new
#                edit_item GET    /items/:id/edit(.:format)      items#edit
#                     item GET    /items/:id(.:format)           items#show
#                          PATCH  /items/:id(.:format)           items#update
#                          PUT    /items/:id(.:format)           items#update
#                          DELETE /items/:id(.:format)           items#destroy
#           top_how_to_use GET    /top/how_to_use(.:format)      top#how_to_use
#              top_q_and_a GET    /top/q_and_a(.:format)         top#q_and_a
#              top_contact GET    /top/contact(.:format)         top#contact
#              top_company GET    /top/company(.:format)         top#company
#                     root GET    /                              top#index

Rails.application.routes.draw do

  devise_for :users
  resources :contacts, except: [:edit, :update, :destroy]
  # resources :top do
  #   collection do
  #     get 'how_to_use'
  #     get 'q_and_a'
  #     get 'company'
  #   end
  # end
  resources :genres
  resources :infos, except: [:show]
  resources :items do
    member do
      get 'preview'
    end
  end
  get 'top/how_to_use', to: 'top#how_to_use' #how_to
  get 'top/q_and_a', to: 'top#q_and_a' # Q & A
  get 'top/contact', to: 'top#contact' # お問い合わせ
  get 'top/company', to: 'top#company' # 会社概要
  root to: 'top#index'
end
