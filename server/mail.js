//send mail
import nodemailer from 'nodemailer';
import dotenv from 'dotenv';
dotenv.config();

const transporter = nodemailer.createTransport({
    host: 'smtp.gmail.com',
    port: 465,
    secure: true, //mayb remove this on test?? YES! MAYBE THIS MIGHT AFFECT US WHEN USING HTTP CHECK I:c
    auth: {
        user: process.env.email,
        pass: process.env.password
    },
});

function generateSecurityCode() {
    let code = "";
    for (let i = 0; i < 6; i++) {
        code += Math.floor(Math.random() * 10); // Random digit from 0-9
    }
    return code;
}

async function sendMail(email) {
    let sec = generateSecurityCode();
    console.log("SEC HERE!!", sec);

    try {
        await transporter.sendMail({
            to: email,
            subject: 'beep boop',
            html: `Your security code is: ${sec}`
        });
        
        console.log(`Sent mail to ${email}`);
        return sec; // Now this will actually return `sec`
    } catch (e) {
        console.log("Error sending mail sowy OwO :D  ", e);
        return false;
    }
}

export default sendMail;