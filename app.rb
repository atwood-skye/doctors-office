require 'sinatra'
require 'sinatra/reloader'
require './lib/doctor'
require './lib/patient'
require './lib/speciality'
also_reload 'lib/**/*.rb'
require("pg")
require 'pry'

DB = PG.connect({:dbname => "doctors_office"})

get '/' do
  erb :index
end

get '/specialities' do
  @specialities = Speciality.all
  erb(:specialities)
end

post '/specialities' do
  speciality = params[:speciality]
  Speciality.new(speciality: speciality).save
  @specialities = Speciality.all
  erb :specialities
end

get '/speciality/:id' do
  @speciality = Speciality.find(params[:id].to_i)
  @doctors = Doctor.all
  erb :doctors
end
