Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "statics#index"

  resources :students
  resources :curriculums do
    resources :enrollments, only: [:index, :create]
    delete 'students/:student_id',
      to: 'enrollments#destroy',
      as: 'enrollment'
  end
end
