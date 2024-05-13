const express = require("express");
const dotenv=require("dotenv")
const mongoose=require("mongoose");
const farmerRouter=require("./routes/farmer");
const customerRouter=require("./routes/customers")
const deliveryRouter=require("./routes/delivery")
const reviewRouter=require("./routes/review")
const vegetableRouter=require("./routes/farmervegetable")
const vegetablecategary=require("./routes/vegetablecategory")
const addressrouter=require("./routes/address")
const orderRouter=require("./routes/order")
const db=require("./utils/database")
const otpcontroller=require("./routes/otpcontroller")
const port = process.env.PORT || 10000;

dotenv.config();
const app=express();

app.use(express.json())
app.use(farmerRouter);
app.use(customerRouter)
app.use(deliveryRouter)
app.use(reviewRouter)
app.use(vegetableRouter)
app.use(vegetablecategary)
app.use(addressrouter)
app.use(orderRouter)
app.use("/users/otpLogin",otpcontroller.otpLogin)
app.use("/users/verifyOTP",otpcontroller.verifyOTP)



app.use(express.urlencoded({extended:true}));

db()

app.listen(port,()=>(
console.log("server is listening")
));