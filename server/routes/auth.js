const express =require("express");
const User = require("../models/user");
const bcriptjs=require('bcrypt');
const jwt=require("jsonwebtoken");


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



// !Sign In Route
authRouter.post('/api/signin' ,async(req,res)=>{
  try{
    const {email,password}=req.body;
    const user=await User.findOne({email});
    if(!user){
      return res.status(400).json({"msg":"User with This email does not exist!"});
    }
    const isMatch=await bcriptjs.compare(password,user.password);
    if(!isMatch){
      return res.status(400).json({"msg":"Incorrect Password"});
    }
   const token= jwt.sign({id: user._id},"passwordKey");
   res.json({token,...user._doc})
  }catch(e){
   
    res.status(500).json({"error":e.message})
  }
})

module.exports=authRouter;