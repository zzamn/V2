import { ChatOpenAI } from '@langchain/openai'
import out from './string.js';
import dotenv from 'dotenv';
dotenv.config();

const llm = new ChatOpenAI({
    model: "gpt-4o",
    temperature: 0,
    openAIApiKey: process.env.openai
    // other params...
  });


async function makeBallad(descriptors) {

    const msg= [
        {
            role: "system",
            content: out.systemPrompt
        },
    
        { 
            role: "user",
            content: descriptors
        },
    ]

    let p= llm.invoke(msg).then(ans => {return ans.content})
    return p

}


async function moderate(text) {

    const msg= [
        {
            role: "system",
            content: out.modPrompt
        },
    
        { 
            role: "user",
            content: text
        },
    ]

    let p= llm.invoke(msg).then(ans => {return ans.content})
    return p

}

let AI = {makeBallad, moderate}
export default AI;
//const reply = makeBallad("eternity, village, summer, coral reef, supercell, demon");
//console.log(reply)

