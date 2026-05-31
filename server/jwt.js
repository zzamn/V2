import jt from 'jsonwebtoken';
import dotenv from 'dotenv';
dotenv.config();

const payload = {name: "obama", role: "user"};
const secret=process.env.secret;
const options = { expiresIn: '1h' };

function makeJWT(p=payload,o=options) {
    const token = jt.sign(p, secret, o);
    return token;
}

function getPayload(d) {
    const payload = jt.decode(d);
    return payload;
}

function check(d) {
    try {
        jt.verify(d,secret);
        return true;
    }
    catch (e) {
        console.log("AyO ERROER!! on check jwt server :c ")
        return false;
    }
}



let jwt = {makeJWT, getPayload, check};
export default jwt;