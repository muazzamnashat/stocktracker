# Stock Tracker

*Stock Tracker* is a web app that let users add stocks to their watchlists. Users can follow stock news and see recommendations on the stocks they are following from stock analysts. 

[see it live here!](https://stock-track-web-app.herokuapp.com/)

## Technologies used

* Ruby (Sinatra framework)
* HTML
* CSS
    
## Features 

* User authentication (Signup / Login)
* Uniqueness of user login attribute(username or email)
* Validation of user input so bad data cannot be persisted to thedatabase.
* CRUD functionality
      *  Users can CREATE, READ, UPDATE or DELETE data that belongs to them only
* Minimal design

![Stock page](https://github.com/muazzamnashat/stocktracker/blob/main/public/Stock_page.png)

* Latest news on stocks
* Stock analysts' recommendation on stocks that user follow

![Analysis image](https://github.com/muazzamnashat/stocktracker/blob/main/public/Analysis_page.png)

## Installation & Setup

* Go to https://github.com/muazzamnashat/stocktracker 
* Clone the repository onto your computer. To clone :
*  Click on the green "Code" button and select "HTTPS" 
*  Copy the link 
* Open your terminal and type pwd to see you current location (The folder you are in). If this is the right folder (this is where you want to clone the repo) or you can change directory.
*  Now, on the terminal type 'git clone' then paste the link.
*  Navigate to the the folder 
* Run bundle install to load the Ruby gems and dependencies.
* Now, if you type 'shotgun' on the terminal the web app will load on local server. 
* Open any browser and paste "http://127.0.0.1:9393/" . The app will start!
* To stop , press control + c .

## Contribution

Please feel free to contribute to the project, and if any bug is found, please contact me at *muazzamhc.nashat@gmail.com*.

## License

Copyright 2020 Muazzam Nashat

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.