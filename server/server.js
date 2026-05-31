import express from 'express'
//import cors from 'cors'
import * as poopy from './json.js'
import sql from './sql.js'
import cookieParser from 'cookie-parser'
import jwt from './jwt.js'
import sendMail from './mail.js'
import { syllableCount } from 'syllable-count-english'
import AI from './AI.js'
import path from 'path'
/*
const cors = require('cors')
const poopy = require('./json')
const sql = require('./sql')
*/
const app = express();

/*
app.use(
    cors({
        origin: 'http://localhost:3000', // Allow frontend to send requests
        credentials: true, // Allow cookies to be sent
    })
);*/ // Enable cross-origin requests. Or else computer blocks and you'll get an error in react. don't need this in the build file :D
app.use(express.json());//Needed for handling JSON data (application/json requests).
app.use(cookieParser()); //if you don't want req.cookies() to return 'undefined' :D

const __dirname = path.resolve();
app.use(express.static(path.join(__dirname, 'build')));

// 🛠 Catch-all route to serve index.html for React Router to work
app.get('*', (req, res) => {
    res.sendFile(path.join(__dirname, 'build', 'index.html'));
});

// 🛠 Start the server
app.listen(6969, 'localhost', () => {
    console.log('Frontend server is running on http://localhost:6969');
});
















app.post('/map0', async (req, res) => {
    //the data in x is the exact same as the input you give. so if your input is
    // {map : mapNo}. then x= {map: 3} or wtv number mapNo is
    const x = req.body
    if (x.expedition==="zero") {
        const [ans, status] = await Promise.all([poopy.getFromZero(x.map-1), sql.checkAvailability(x.map)])
        res.json({ans: ans, availability: status});
    }
})


app.post('/map0AfterData', async (req,res) => {

    const x = req.body;
    const answer = await sql.getMapData(x.map)

    //now break the haiku
    const haikuLines = answer.haiku.split('|');

    res.json({
        title: answer.title,
        haiku1: haikuLines[0],
        haiku2: haikuLines[1],
        haiku3: haikuLines[2],
        lore: answer.lore,
        username: answer.username,
        poem: answer.poem
    });

})

app.post('/send', async (req,res) => {
    const x = req.body;
    let haiku = [x.haiku1, x.haiku2, x.haiku3].join('|')
    //check haikus
    let haikuCheck = (syllableCount(x.haiku1)===5 && syllableCount(x.haiku2)===7 && syllableCount(x.haiku3)===5);
    //moderation


    let ans = {
        haikuGood: haikuCheck,
        contentGood: true,
        modMsg: null
        
    }

    if (haikuCheck) {
        let data = "Title: " + x.title + ". Haiku: " + x.haiku1 + ". " + x.haiku2 + ". " + x.haiku3 + ".  Lore:" + x.lore;
        let aiReply = await AI.moderate(data)
        // eslint-disable-next-line eqeqeq
        if (aiReply[0]=="0") {
            ans.contentGood = false;
            ans.modMsg = aiReply.slice(2);
        }

    }
    if (ans.haikuGood && ans.contentGood) {
        //
        
        await sql.addMapInput(x.mapNo, x.username, haiku, x.title, x.lore)

    }

    res.json(ans)
})

app.post('/map0InitData', async (req,res) => {
    const x = req.body;
    const token = req.cookies.auth;
    let ans = {
        poem: "When the bruh and the bruh",
        user: null, //since username should have min 4 chars, if user is x, DED
        reserved: null
    }
    if (token) {

        let isValid = jwt.check(token);
        if (isValid) {

            ans.user=jwt.getPayload(token);
            ans.user = ans.user.name;
        }

    }

    let y = await sql.getMap0InitData(x.mapNo);
    ans.poem = y.poem;
    ans.reserved = y.reservedBy;

    res.json(ans)
})

//I gotta make a funxtion that checks if a user has signed in
app.post('/signedIn', async (req, res) => {
    const token = req.cookies.auth;
    
    if (!token) {
        return res.json({ans: false});
    }

    let isValid = jwt.check(token);

    res.json({ans: isValid});
});




app.post('/loginn', async (req,res) => {

    //check data against the server. Return true or false or wtv yk :D.
    let loginData = req.body;
    let email= loginData.email;
    let password = loginData.password;
    let isUser = await sql.checkUser(email,password)

    if (isUser) {
        let uname = await sql.getUsername(email);
        const token = jwt.makeJWT({name: uname, role: "user"});

        //MAJOR WARNING!!! ⚠️⚠️⚠️⚠️⚠️
        // SET secure: true IN PRODUCTION!! ⚠️⚠️⚠️⚠️⚠️
        res.cookie('auth', token, {
            httpOnly: true,    // Prevent JavaScript from accessing cookies
            secure: false,     // Set to 'true' in production (HTTPS only)⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
            sameSite: 'lax'    // Allows cookies across different ports on localhost
        });
        res.json({ans: true})
    }
    else {
        res.json({ans: false})
    }


});

//if signup data is legit, the email will be sent. The code will be stored. And the success will be told to the front end 
app.post('/signupp', async (req,res) => {

    let loginData = req.body;
    let email= loginData.email;
    let username= loginData.username;
    let status = await sql.checkUserSignup(username, email)

    // eslint-disable-next-line eqeqeq
    if (status==0) {
        let code = await sendMail(email);

        await sql.addCode(email,code);
    }
    res.json({status: status})


})

app.post('/authenticateCode', async (req,res) => {
    let x=req.body;
    let code = x.code;
    let username = x.username;
    let email=x.email;
    let password = x.password;

    let ans = await sql.authenticate(email, code);
    //check if email and code exit

    if (ans) {
        //put his data on the thingy
        await sql.newUser(username,email,password);
        //and log him in bruh. 
        const token = jwt.makeJWT({name: username, role: "user"});
        //MAJOR WARNING!!! ⚠️⚠️⚠️⚠️⚠️
        // SET secure: true IN PRODUCTION!! ⚠️⚠️⚠️⚠️⚠️
        res.cookie('auth', token, {
            httpOnly: true,    // Prevent JavaScript from accessing cookies
            secure: false,     // Set to 'true' in production (HTTPS only)⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
            sameSite: 'lax'    // Allows cookies across different ports on localhost
        });
        res.json({status: true});
    }

    else {
        res.json({status: false});
    }


    //if not, return false

    //else return true
    //send the email and 

});

app.post('/reserveMap0', async (req,res) => {

    let x = req.body;
    let can = await sql.canUserReserve(x.user);
    if (can) {
        await sql.reserveMap0(x.mapNo, x.user);
        res.json({a: true})
    }

    else {

        res.json({a: false})
    }

})

app.post('/getTitles0', async (req,res) => {
    let x = await sql.getTitles();
    res.json({titles: x})
})