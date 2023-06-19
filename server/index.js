//IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");
//IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");

//INIT
const PORT = 3000;
const app = express();
const DB =
  "mongodb+srv://manankumar1702:Manan%402003@cluster0.oplihuv.mongodb.net/?retryWrites=true&w=majority";
// special character in password with the ascii code @=%40
//middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);
// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
