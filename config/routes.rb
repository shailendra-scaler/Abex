Abex::Engine.routes.draw do

  scope :module => :abex do
    post '/' => 'evaluation#create'
    post '/batch' => 'evaluation#batch_creatẻ'
  end

end
