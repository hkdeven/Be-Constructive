# CONSTRUCTIVE | empowered creativity

Specifically designed for developers, ***CONSTRUCTIVE*** is a fully-responsive web application of the most influential and active designers and their creations. Need inspiration for your project?  Be inspired, be ***CONSTRUCTIVE***.    

Because of the offline nature of this application, we regret that we cannot yet provide a live demo.  However, you are welcome to use the source code provided and setup instructions below to run your own version of this dynamic application.

--------------------------------------
![screenshothomepage](https://github.com/hkdeven/Be-Constructive/blob/master/app/assets/images/Screen%20Shot%202016-06-02%20at%204.44.09%20PM.png?raw=true)
--------------------------------------

## THE PROBLEM
>The US accounts for 25% of the world's prison population, spending between $60-70k on each prisoner annually (5x more than higher education). After one year from release, 75% are unemployed and over 60% will return to prison. [The Last Mile](http://thelastmile.org/) is an organization that has been providing computer programming skills to inmates for the last five years. The recidivism rate for their students is 0%. Not one former inmate has returned to jail upon release.

## THE SOLUTION
Lacking access to the internet, this program was missing a developer-oriented design tool for students that would provide creative inspiration for course assignments and projects as well as exposure to real-world projects and trends. Students at the Florida-based [Wyncode Academy](https://wyncode.co/), moved by the [The Last Mile's](http://thelastmile.org/) program and success, took on this task as their final project to end their technical training. Building onto this foundation, next steps will include incorporating current tech news, using the Huffington Post's [Huffpost CODE](http://www.huffingtonpost.com/huffpost-code/) rss feed, to the resource section. We are also working on a developer-design-oriented blog, The Suave Developer, to provide learning articles on topics ranging from CSS and SASS to Sketch and Codepen-like demos.

## THE WHY
*Watch the TEDx video:*    
[![YOUTUBE](http://thelastmile.org/wp-content/uploads/2015/09/tedx-san-diego.jpg)](https://www.youtube.com/watch?v=sOSXTtA-_Jk&feature=player_embedded)    
*Watch the WIRED video:*    
[![YOUTUBE](http://thelastmile.org/wp-content/uploads/2015/09/passion.jpg)](https://www.youtube.com/watch?v=yTpGj7Vq3E4)    

###### More Information
For more information about The Last Mile, we encourage you to visit [thelastmile.org](http://thelastmile.org/).    


# Setup Instructions
Because of the offline nature of this application, we regret that we cannot yet provide a live demo.  However, you are welcome to use the source code provided to setup your own version of this dynamic application.

# Preparing Your Environment

Starting from your local terminal, make a clone of the repo:

```ruby
git clone https://github.com/hkdeven/Be-Constructive.git
```

Ensure the following gems into your gemfile and run ` bundle install ` from the command line.

```ruby
gem 'httparty'
gem 'seed_dump'
gem 'clockwork'
gem "paperclip", "~> 5.0.0.beta1"
gem 'rails_12factor'
```
Save your file and run ` bundle install ` from the command line.    

Then be sure ot migrate:
```ruby
rake db:migrate
```

# The Dribbble API

A majority of the content is compiled using the Dribbble API. Please note that you must register your application and authenticate with either OAuth or your API client access token when making requests. Follow the details outlined in depth at [developer.dribbble.com](http://developer.dribbble.com/v1/). Modify the `Be-Constructive/lib/tasks/dribbble.rake' file with your new API keys from Dribbble.

Be sure you're storing your API keys securely using your environment variables.  [Read more](https://github.com/dwyl/learn-environment-variables/blob/master/README.md) for instructions.

# Get Content

Now you're ready to to start pulling content using our customized rake task from the command line by either running    
` rake dribbble:get_recent `
Or you may use the included cron task to have this task automated ot whatever timeframe you like.  Simply go to the `Be-Constructive/clock.rb` and adjust the metrics accordingly. It is suprising how simple this task has become thanks to the Clockwork gem.  After modifying the cron task you'll want to run:
` clockwork clock.rb ` 

After your first rake task has successfully completed, you'll need to populate your database with this new content:
` rake db:seed:dump `

# Launch and Enjoy!

Ensure that your Postgresql server is running and start your server from the command line:
` rails s `

In your browser visit the `localhost` address identified in your terminal, typically this is `localhost:3000`.

## Screenshots of the Application

![screenshot](https://github.com/hkdeven/Be-Constructive/blob/master/app/assets/images/Screen%20Shot%202016-06-02%20at%204.44.27%20PM.png?raw=true)
--------------------------------------
![screenshot](https://github.com/hkdeven/Be-Constructive/blob/master/app/assets/images/Screen%20Shot%202016-06-02%20at%204.44.48%20PM.png?raw=true)
--------------------------------------
![screenshot](https://github.com/hkdeven/Be-Constructive/blob/master/app/assets/images/Screen%20Shot%202016-06-02%20at%204.45.13%20PM.png?raw=true)
--------------------------------------
![screenshot](https://github.com/hkdeven/Be-Constructive/blob/master/app/assets/images/Screen%20Shot%202016-06-02%20at%204.45.45%20PM.png?raw=true)
--------------------------------------
![screenshot](https://github.com/hkdeven/Be-Constructive/blob/master/app/assets/images/Screen%20Shot%202016-06-02%20at%204.46.06%20PM.png?raw=true)
--------------------------------------
![screenshot](https://github.com/hkdeven/Be-Constructive/blob/master/app/assets/images/Screen%20Shot%202016-06-02%20at%204.46.25%20PM.png?raw=true)
--------------------------------------
![screenshot](https://github.com/hkdeven/Be-Constructive/blob/master/app/assets/images/Screen%20Shot%202016-06-02%20at%204.46.39%20PM.png?raw=true)
--------------------------------------
![screenshot](https://github.com/hkdeven/Be-Constructive/blob/master/app/assets/images/Screen%20Shot%202016-06-02%20at%204.46.55%20PM.png?raw=true)
--------------------------------------
![screenshot](https://github.com/hkdeven/Be-Constructive/blob/master/app/assets/images/Screen%20Shot%202016-06-02%20at%204.47.04%20PM.png?raw=true)
--------------------------------------
![screenshot](https://github.com/hkdeven/Be-Constructive/blob/master/app/assets/images/Screen%20Shot%202016-06-02%20at%204.47.19%20PM.png?raw=true)
--------------------------------------
## About Constructive
![logo](http://s33.postimg.org/xxaj6bl7z/master_logo.png)    
Be inspired, be CONSTRUCTIVE.    

Constructive is maintained and funded by the students at [Wyncode Academy](https://wyncode.co/).    
We love open source software!    
Hire us for your next creative inspiration:    
[Deven Blackburn] & [Deri Cleland]

[Deven Blackburn]: https://www.linkedin.com/in/devenblackburn
[Deri Cleland]: https://www.linkedin.com/in/deri-cleland-74494441
