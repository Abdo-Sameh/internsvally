Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "emails_check#index"

  match 'check_mail', to: 'emails_check#check_mail', via: [:get]

  match 'check_mail', to: 'emails_check#show', via: [:get]

end
