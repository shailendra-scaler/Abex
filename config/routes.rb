Abex::Engine.routes.draw do

  scope :module => :abex do
    resource :variants

    get 'evaluate' => 'evaluation#evaluate'
    get 'batch_evaluate' => 'evaluation#batch_evaluate'
  end

end
