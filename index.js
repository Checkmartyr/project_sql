const express = require('express')
const app = express()
const ejs = require('ejs')
const mongoose = require('mongoose')
const expressSession = require('express-session')
const flash = require('connect-flash')
const multer = require('multer')
const path = require('path'); 
const mysql = require('mysql2');
const bcrypt = require('bcrypt');
//conect to db
mongoose.connect("mongodb+srv://mayoi:Puchit4826@cluster0.pyaz4rl.mongodb.net/?retryWrites=true&w=majority",{
    useNewUrlParser: true
})
// const { validationResult } = require('express-validator');

const dbConfig = {
    host: 'localhost',
    user: 'root',
    database: 'project',// Include your actual password here
};

global.dbConnection;
const connectDB = () => {
    dbConnection = mysql.createConnection(dbConfig);

    dbConnection.connect((err) => {
        if (err) {
            console.error('Error connecting to the database:', err);
            return;
        }
        console.log('Connected to the database');
    });
};

connectDB();

global.loggedIn = null


// controllers
const loginregisterController = require('./controllers/loginregsincontroller')
const indexcontroller = require("./controllers/indexcontroller")
const stroreUsercontroller = require("./controllers/stroreUsercontroller")
const loginUserController = require("./controllers/loginUserController")
const logoutController = require('./controllers/logoutController')
const createController = require('./controllers/createcontroller')
const uploadController = require('./controllers/uploadController')
const uploaddbcontroller = require('./controllers/uploaddbcontroller')
const menuController = require('./controllers/menuController')
const buyController = require('./controllers/buyController')
const profileController = require('./controllers/profileController')
const drawcontroller = require('./controllers/drawcontroller')
const editController = require('./controllers/editController')
const deleateController = require('./controllers/deleateController')
const commentcontroller = require('./controllers/commentcontroller')

// const upload = require('./controllers/uploadController')


// // database
// const db = require('./database/db')
// const { render } = require('ejs')
// const upload = multer({dest: 'uploads/'})

// // models
// const User = require('./database/models/User')

// middlewere
const redirectIfAuth = require('./middleware/redirectIfAuth')
const authMiddleware = require('./middleware/authMiddleware')


 
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, './public/uploads')
    },
    filename: (req, file, cb) => {
        cb(null, 'file-' + Date.now() + '.' +
        file.originalname.split('.')[file.originalname.split('.').length-1])}
})

const upload = multer({ storage: storage })


app.use("/login-register", loginregisterController)
app.use(express.static(__dirname + '/public'))
app.use(express.json())
app.use(express.urlencoded({extended: true}))
app.use(flash())


// app.use(multer({
//     dest: path.join(__dirname, '/public/uploads/'),
//     filename: (req, file, cb) => {
//         cb(null, 'file-' + Date.now() + '.' +
//         file.originalname.split('.')[file.originalname.split('.').length-1])}
// }).single('file'))


app.use(expressSession({
    secret: "node secret"
}))


app.use("*", (req, res, next) => {
    loggedIn = req.session.userId
    console.log(loggedIn);
    next()
})
app.set('view engine', 'ejs')
     

app.get("/",indexcontroller)
app.get('/manu', menuController)
app.post("/register",redirectIfAuth,stroreUsercontroller)
app.post("/login",redirectIfAuth,loginUserController)

app.post("/buy/:buyID",authMiddleware,buyController)

app.get('/profile/:id',authMiddleware,profileController)
app.get('/product/:id',authMiddleware,drawcontroller)

app.post('/edit/:id',authMiddleware,editController)
app.post('/upload', uploaddbcontroller,uploadController)
app.post('/comment/:id',authMiddleware,commentcontroller)
app.get('/logout', logoutController)
app.get("/login_or_register",redirectIfAuth,loginregisterController)
app.get('/create',authMiddleware,createController)
app.post('/delate/:id',authMiddleware,deleateController)
app.listen(4000, () => {
    console.log("App listening on prot 4000");
    
})  