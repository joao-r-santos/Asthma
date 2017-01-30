from flask import render_template, request
from app import app

from counties import ListCounties

# Libraries for SQL
#from sqlalchemy import create_engine
#from sqlalchemy_utils import database_exists, create_database
import pandas as pd
#import psycopg2

#user = 'joao'
#psswrd = 'insight17a'
#host = 'localhost'
#dbname = 'birth_db'
#db = create_engine('postgresql://%s:%s@%s/%s'%(user,psswrd,host,dbname))
#con = None
#con = psycopg2.connect(database=dbname, user=user, password=psswrd, host=host)


@app.route('/')
@app.route('/index')
@app.route('/index.html')
def index():
  return render_template('index.html')

@app.route('/hello')
@app.route('/hello.html')
def hello():
  user = {'nickname': 'visitor'}  # fake user
  posts = [  # fake array of posts
          {
            'author': {'nickname': 'John'},
            'body': 'Beautiful day in Boston!'
          },
          { 
            'author': {'nickname': 'Ashley'}, 
            'body': 'The movie High Hell or High Water was so cool!' 
          }
          ]
  return render_template('hello.html', title='Welcome', user=user, posts=posts)

@app.route('/about')
@app.route('/about.html')
def about():
  return render_template('about.html')

@app.route('/realtime')
@app.route('/realtime.html')
def realtime():
  return render_template("realtime.html")

@app.route('/input')
def breath_input():
  return render_template("input.html")

@app.route('/output')
def breath_output():
  #pull 'county_name' from input field and store it
  county_name = request.args.get('county_name')
  county_name= county_name.title()

  #just select the county from the counties database
  county_names= ListCounties()
  if county_name in county_names:
    result= county_name
    return render_template("output.html", result= result)
  else:
    return render_template("output.html")



