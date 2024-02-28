const express = require("express");

const mongoose=require("mongoose");
const farmerRouter=require("./routes/farmer");
const db=require("./utils/database")

const app=express();

app.use(express.json())
app.use(farmerRouter);


app.use(express.urlencoded({extended:true}));

db()

app.listen(3000,"0.0.0.0",()=>(
console.log("server is listening")
));
