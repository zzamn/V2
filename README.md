1) this thing needs a .env file, I've put a .env.example, so feel free to use that to make your .env file :D


2) There'll be the 'email' and 'password' fields, which is used for user sign up authentication. altexpeditions@gmail.com would send the sign-ee a code and they have to type that code into the website to have an account. So, if you're planning to run this by yourself, this field can be left blank. But this also means that since this website needs an account to submit stuff, you have to manually add a username, email and password in the MySQL database (see point #3) since I'm obviously not giving you the password to altexpeditions@gmail.com XD

3) V2 also needs a mysql database, so i've added an init.sql in the 'db' directory :P

4) Activate by doing node server/server.js  Yep. THis means that you gtotta activate he server from the root of this directory :)
