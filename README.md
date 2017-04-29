# MakersBnB
Utilising aesthetics that could be loosely associated with styling, MakersBnB is an AirBnB bootleg of a most endearingly mediocre standard. It was constructed in 4 days in a team of 4 and is therefore slightly unfinished but, as a first group project,  we're still proud of it anyway! 
FAQs:
> Will improvements be made in the future?
> Won't beat around the bush and go for a solid maybe.

> How much can I buy this for?
> That's a great question, a fiver and or a small dog should do it.

## Booting up this fragile Sinatra App
Without further ado, lets set up a local server and get this questionable app running on your machine.
From here on out there is an assumption that you're familiar with interacting with the terminal, git and have ruby installed on your machine. Sorry that this isn't of more use, but we haven't actually been using these tools for too long and aren't 100% sure what's going on ourselves. If you're not bothered, then don't worry, you're not really missing out on too much! 

### 1) Clone this repository

```
 cd /wherever/you/want/to/clone/this/repo
 git clone https://github.com/whatsrupp/makers-bnb
```

### Basic requirements
Firstly install bundler, this will make installing everything else a dream

gem intall bundler

then cd to the main directory of makers-bnb
```
cd to/the/location/of/makers-bnb
```
run bundler
```
bundle install 
```
your machine should now have all the required packages to kick things off.
### Boot the server
Launch the server using the rackup gem
```
rackup
```
you should then see a server log that looks something like the below:
```
[2017-04-29 23:50:14] INFO  WEBrick 1.3.1
[2017-04-29 23:50:14] INFO  ruby 2.4.0 (2016-12-24) [x86_64-darwin16]
[2017-04-29 23:50:14] INFO  WEBrick::HTTPServer#start: pid=18767 port=9292
```
the listed port (in this case 9292) is the port you need to access in your browser. 
Open up the browser and enter the following into your URL.
```
localhost:9292
```
### Enjoy!
Sign up and have a play! Just a heads up, the styling gets progressively worse the further you get through the file roots, it's one of our USPs.

## Packages Used
Shout out to the main gems in our lives for the last week 
bcrypt - keeping those passwords deliciously salted
capybara - allows us to run tests in a headless browser 
sinatra - good singer, better web-app manager
data-mapper - handles talking to the servers so you don't have to
database cleaner - clears out swathes of rubbish in your server generated by your tests
rack - 'rack up' those servers 
pry - probably shouldn't still be in the dependancies but it saved us on the debugging
rspec - keeping it all TDD since day 1


## Developers
Alice Cheung
Freddy Fallon
Nick Rupp
Hasan Sonmez

## User stories:

Below are the user stories we used to define the functionality of our minimum viable product MVP

```
As a user
So that I can use the website
I want to sign up for an account
```

```
As a user
So that I can return to the website
I want the functionality to log in
```

```
As a user
So that I can finish my session when I'm done
I want the functionality to log out

```

```
As a host
So that potential guests can view the spaces that I list
I want to list a single space
```

```
As a host
So that I can offer more choice to potential guests
I want to list multiple spaces
```

```
As a host
So that potential guests can identify my space
I want to give my listing a name
```

```
As a host
So that potential guests can better understand my space
I want to provide a description alongside my listing
```

```
As a host
So that I can make money by listing my space
I want to provide a nightly price for my listing
```

```
As a host
So that potential guests can only book my space when I'm not there
I want my listings to have a range of available dates
```

```
As a guest
So that I can plan my trip
I want to request hire for one night
```

```
As a host
So that I can help potential guests plan their trips
I want to approve a hire request
```

```
As a host
So that I can see when I have guests coming to stay
I want to mark a space as booked
```

```
As a host
So that I can rent my space
I want to ensure potential guests can request hire up until a space is marked as booked
```
