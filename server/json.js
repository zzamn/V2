
//HOW??! THIS SOMEHOW NEEDS TO USE IMPORT...
// BUT THE REACT FILES DON'T NEED TO IMPORT SHIT USING 'penis.js' ??! I THOUGHT THE 'penis' WAY OF IMPORTING WAS AAA.
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const filePath = path.join(__dirname, 'a.json'); // Always points to the correct location*/

/*const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, 'a.json'); // Always points to the correct location*/


//APPARENTLY FS.READFILE IS ASYNC!! WTF?!?

export function getFromZero(map) {
    //basically ok....so.. a resolve/reject is basically return statement. 
    // But resolve is a positive return whereas reject i s negative. 
    // And..only when I run this  promise thingy will the code inside it run and return either positivelu pr negaatively.
    return new Promise((resolve, reject) => {

        fs.readFile(filePath, 'utf-8', (err,data) => {
            if (err) {
                console.log("Err 1")
                reject("Eror 1")
            }
    
            try {
                let d = JSON.parse(data);
                let ans = d.zero[map]
                //of the form [[],[]] => [loc,heightMap] :D
                resolve(ans)
            }
    
            catch (err) {
                console.log("Err 2")
                reject("error 2 D:")
            }
        })

    })
}

