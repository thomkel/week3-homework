Dice::Application.routes.draw do

  get("/dice", { :controller => 'dice', :action => 'show_rules'})

  get("/dice/rolldice", { :controller => 'dice', :action => 'roll_dice'})

end
