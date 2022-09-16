const express =require("express");
const User = require("../models/user");
const bcriptjs=require('bcrypt');


const authRouter=express.Router();



// !SignUp
authRouter.post('/api/signup',async(req,res)=>{
// 1: get the data from clint
// 2:post the data in databse
// 3:return that data to the user

try{
    const {name,email,password}=req.body;
const existingUser=await User.findOne({email});
if(existingUser){
return res.status(400).json({msg:'User with same email already exists'});
} 

const hashPasseword=await bcriptjs.hash(password,8);
let user= new User({
  email,
  password:hashPasseword,
  name
});
user=await user.save();
res.json(user)
}catch(e){
    res.status(500).json({'err':e.message})
}



});



module.exports=authRouter;