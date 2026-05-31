import mysql from 'mysql2'; //yarn add mysql2
import dotenv from 'dotenv';
dotenv.config();

const pool = mysql.createPool({
    host: process.env.sqlH,
    user: process.env.sqlU,
    password:  process.env.sqlP,
    database: process.env.sqlD
}).promise();


//map0Input table start

async function checkAvailability(mapNo) {
    const [rows] = await pool.query( //This is because data returned from x= .
        'SELECT available FROM map0Input WHERE mapNo = ?',
        [mapNo]);

    return rows[0].available
}

//give..TITLES??!
async function getTitles() {
    const [ans] = await pool.query("select title from map0Input order by mapNo asc")
    let sol=ans.map((obj) => {return obj.title})
    /*
    for (let i=0; i<ans.length; i++) {

        const {title, mapNo} = ans[i];
        sol.push([title,mapNo]);

    }*/
    return sol
}
async function getMapData(mapNo) {
    const [values] = await pool.query(
        'SELECT title,haiku,lore,username,poem FROM map0Input WHERE mapNo = ?',
        [mapNo]);

    return values[0]
}

async function addMapInput(mapNo, user, haiku, title, lore) {
    await pool.query(
        'UPDATE map0Input SET username = ?, haiku = ?, title = ?, lore = ?, available = FALSE WHERE mapNo = ?',
        [user, haiku, title, lore, mapNo] // Pass null explicitly
    );
}


async function makeMapAvailable(mapNo) {
    await pool.query('UPDATE map0Input SET available = TRUE where mapNo=?',[mapNo]);
}

async function getMap0InitData(mapNo) {
    let [data]= await pool.query('select reservedBy, poem from map0Input where mapNo= ?', [mapNo]);
    return data[0];
}

async function reserveMap0(mapNo, user) {
    console.log(`Reserving mapNo: ${mapNo} for user: ${user}`);

    const query = `
        UPDATE map0Input 
        SET reservedBy = ?, expiry = NOW() + INTERVAL 60 MINUTE 
        WHERE mapNo = ?;
    `;

    try {
        await pool.query(query, [user, mapNo]);
        console.log('Reservation updated.');
        return true
    } catch (error) {
        console.error('Error updating reservation:', error);
        return false;
    }
}

async function canUserReserve(user) {
    let [[{count}]] = await pool.query('SELECT count(*) as count FROM map0Input WHERE reservedBy=?',[user])

    if (count>=1) {
        return false;
    }
    return true;
}


//map0Input table end





// authenticator table start
// Async function to insert/update code
async function addCode(email, code) {
    console.log(code)
    const query = `
        INSERT INTO authenticate (email, code, expiry_time)
        VALUES (?, ?, NOW() + INTERVAL 5 MINUTE)
        ON DUPLICATE KEY UPDATE 
            code = VALUES(code),
            expiry_time = VALUES(expiry_time);
    `;

    try {
        await pool.query(query, [email, code]);
        console.log('Code added/updated.');
    } catch (error) {
        console.error('Error inserting/updating code:', error);
    }

}

//checks if the user's authentication code is correct
async function authenticate(email, code) {
    let [[{count}]] = await pool.query('SELECT count(*) as count FROM authenticate WHERE email=? and code = ?', [email,code]);
    // eslint-disable-next-line eqeqeq
    return count==1;
}


async function getCodes() { // Removed codee since it's not used
    let [rows] = await pool.query('SELECT code FROM authenticate');

    if (rows.length > 0) {
        let ans = rows.map(row => row.code); // Extracts all codes directly
        return ans;
    } else {
        console.log("Codes do not exist");
        return false; // No codes found
    }
}
//authenticator table  end










//users table start
//checks if user exists
async function checkUser(e,p) {
    const [[{count}]] = await pool.query("select count(*) as count from users where email=? and password =?",[e,p])
    // eslint-disable-next-line eqeqeq
    return count==1;
}

async function getUsername(e) {
    const [ans] = await pool.query("select username from users where email=?",[e])
    return ans[0].username;
}

//adds new user
async function addUser(e,p) {
    await pool.query("insert into users (email,password) values (?,?)", [e,p]);
};


//removes user
async function remUser(e,p) {
    await pool.query("delete from users where email=? and password=?", [e,p]);
}

//shows all users
async function showAllUsers() {
    const all = await pool.query("select * from users")
    return all[0];
}
//checks if the username and email is eligible for signup
async function checkUserSignup(u,e) {

    let ans=0;

    let [[{email}]] = await pool.query(
        "select count(*) as email from users where email=?",[e,u]
    )
    console.log(email)
    ans+=email

    let [[{username}]] = await pool.query(
        "select count(*) as username from users where username=?",[u]
    )

    ans+=(username*2)

    return ans;

}

async function newUser(u,e,p) {
    await pool.query(
        "INSERT INTO users (email, username, password) VALUES (?, ?, ?)",
        [e, u, p]
      );

    return true;
}
//users table end



let sql = {checkAvailability, canUserReserve, newUser, getUsername, reserveMap0, addMapInput, makeMapAvailable, getMapData, getTitles, getMap0InitData, addCode, authenticate, getCodes, checkUser,addUser, remUser, showAllUsers, checkUserSignup}

export default sql;