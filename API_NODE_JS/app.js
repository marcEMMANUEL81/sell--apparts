const express = require("express");
const mysql = require("mysql");
const myconnection = require("express-myconnection");
const bodyParser = require("body-parser");
const todoRegisterRoutes = require("./routes/route");

const optionBd = {
    host: "localhost",
    user: "marc",
    password: "7G))pIHs.BZlfo8r",
    port: "8889",
    database: "appart_db",
};

const app = express();
app.use(express.json());
app.use(bodyParser.json());

//definition du middleware de connexion avec la bd

app.use(myconnection(mysql, optionBd, "pool"));
app.use(express.urlencoded({ extended: false }));

//preferences

app.use((req, res, next) => {
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.setHeader(
        "Access-Control-Allow-Headers",
        "Origin, X-Requested-With, Content, Accept, Content-Type, Authorization"
    );
    res.setHeader(
        "Access-Control-Allow-Methods",
        "GET, POST, PUT, DELETE, PATCH, OPTIONS"
    );
    next();
});

app.use("/api/apparts", todoRegisterRoutes);
module.exports = app;