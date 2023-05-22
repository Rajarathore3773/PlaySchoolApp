Rails.application.routes.draw do
 #  resources :schools do 
#     resources :students
#  end

#  resources :sclasses do 
#     resources :students
#  end

#  resources :students do
#   # resources :reports
#    get "/reports/:id" , to:"reports#show" 
#  end

#This Route For Schools controllers
resources :schools
get '/schools/:id/students' , to:"schools#school_students"
get '/schools/:id/class' , to:"schools#school_classes"

#This Route For class controllers
resources :sclasses
get '/sclasses/:id/school' , to:"sclasses#sclass_school"
get '/sclasses/:id/students' , to:"sclasses#sclass_students"


#This Routes For Student Controllers
get "/students" , to:"students#index"
get "/students/:id" , to:"students#show"
post "/students" , to:"students#create"
put "/students/:id" , to:"students#update"
delete "/students/:id" , to:"students#destroy"



# This Routes for Report Controller

get "/reports" , to:"reports#index"
post "/reports" , to:"reports#create" 
put "/reports/:id" , to:"reports#update" 
delete "/reports/:id" , to:"reports#destroy" 

# Filter Report Routes 
#get "filter/reports/" , to:"reports#filter"

get "/student/:id/reports" , to:"reports#show" 
get "/reports/:id" , to:"reports#show"
get "school/:id" , to:"reports#school"
get "class1/:id" , to:"reports#class1"
get "student/:id" , to:"reports#student"
get "/student/:s_lname/:s_fname/:s_age/reports" , to:"reports#filter" 

#filter the Student attributes
 #get '/students/:s_fname', to:"students#first_name"
 #get '/students/:s_lname', to:"students#last_name"
 #get "/students/:s_age", to:"students#age"
# get "/students/:s_address", to:"students#address"
 #get "/students/:s_father", to:"students#father_name"
 get "students/:s_mother", to:"students#mother_name"













end
