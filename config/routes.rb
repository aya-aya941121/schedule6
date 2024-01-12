Rails.application.routes.draw do
  resources :schedules
  # delete 'schedules/:id', to: 'schedules#destroy', as: 'destroy_schedule' # 追加: 削除処理のルート
  root to: 'schedules#index'
end 