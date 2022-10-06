class BackgroundController < ApplicationController
  
  skip_before_action :authorize

  def index
    render json: {image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUg1MiNS7mtrNIsNkKdaBK-kN6X3tH3mXCTvy0tG8k5A&s"}
  end

end
