//  Import Form Package
const express =require('express');
const mongoose =require('mongoose');



// Import Form Others Files
const authRouter=require('./routes/auth')
// Init
const app=express();
const PORT=process.env.PORT || 3000;
const DB='mongodb+srv://bhuian:dlpi2vxKa9cBARgP@cluster0.o7cf44f.mongodb.net/?retryWrites=true&w=majority';
// middleware
app.use(express.json())
app.use(authRouter);

// Connection
mongoose.connect(DB).then(()=>{
    console.log('database connected');
}).catch(e=>{
    console.log(e);
});
// Create API
app.get('/',(rec,res)=>{
   res.json({name:'Rivaan'})
})
app.get('/home',(rec,res)=>{
    res.send('This is home page')
})

app.listen(PORT,"0.0.0.0",()=>{
    console.log("Connected at port"+PORT);
})


// bhuian
// dlpi2vxKa9cBARgP