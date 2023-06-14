Abex::Engine.routes.draw do

  scope :module => :abex do
    get '/' => 'evaluation#index'
    get '/batch' => 'evaluation#batch'
  end

end
