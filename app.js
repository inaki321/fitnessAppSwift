// REQUIRED STUFF --------------------------------------------------------------------
const bodyParser = require('body-parser');
const express = require('express')
const path = require('path');
const multer = require('multer');
const mysql = require('mysql');
const useragent = require('express-useragent');

const app = express();
const port = process.env.PORT || 9000;

// Set Favicon
//var favicon = require('serve-favicon');
//app.use(favicon(path.join(__dirname, 'src/img/', 'icon.ico')));

var upload = multer({
	limits: { fieldSize: 20 * 1024 * 1024 }
})

// Parse json data
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

// For multi form data
app.use(upload.array());

//Secure SHA256
let crypto;
try {
	crypto = require('crypto');
} catch (err) {
	console.log('crypto support is disabled!');
}

app.use(useragent.express()); // mobile detection




// [ MYSQL ]  ----------------------------------------------------------------------------


var db_config = {
	host:"127.0.0.1",
	user:"root",
	password: "root",
	database: "examen",
	port:"3306"
};

var connection;

function handleDisconnect() {
	connection = mysql.createConnection(db_config); // Recreate the connection, since
													// the old one cannot be reused.

	connection.connect(function(err) {              // The server is either down
		if(err) {                                     // or restarting (takes a while sometimes).
			console.log('[ERR] error when connecting to db:', err);
			setTimeout(handleDisconnect, 2000); // We introduce a delay before attempting to reconnect,
		}
		else {
			console.log("[OK] Database server running...");
		}                                     // to avoid a hot loop, and to allow our node script to
	});                                     // process asynchronous requests in the meantime.
											// If you're also serving http, display a 503 error.
	connection.on('error', function(err) {
		console.log('[ERR] DB disconected...');
		if(err.code === 'PROTOCOL_CONNECTION_LOST') { // Connection to the MySQL server is usually
			handleDisconnect();                         // lost due to either server restart, or a
		} else {                                      // connnection idle timeout (the wait_timeout
			throw err;                                  // server variable configures this)
		}
	});
}

handleDisconnect();

// ENDPOINTS ----------------------------------------------------------------------------

// [ LOGIN ] Admin -----------------------------------------------------------------
var session = require('express-session')
app.set('trust proxy', 1) // trust first proxy
app.use(session({
	secret: 'secret_perchamagasin',
	resave: false,
	saveUninitialized: false
}))

app.get('/check_login/:ID/:pass', function(req, res) {

	const {pass } = req.params.pass; //sin hash
	const {ID } = req.params.ID;
	

	const sql = `SELECT contrasena FROM Usuario WHERE id=${ID}`;

	var psswd
	connection.query(sql,(err,result)=>{
		if(err){
			passwd = "2000";
		}
		if(result.length > 0) {
			passwd = result[0].Contrasena;
		}
		else {
			passwd = "2000";
		}
	});

	var hashed_input = crypto.createHmac('sha256', pass)
		.digest('hex');



	if(hashed_input==passwd)
	{
		req.session.flag = 1;
		res.send("1"); // OUI correcto paswordo
	}
	else
	{
		req.session.flag = 0;
		res.send("0"); // Not so correctou
	}
});


// [ GET ] ALL ----------------------------------------------

app.get('/get/user/:user', function(req, res) {

	const{user} = req.params
	const sql = `SELECT * FROM User WHERE user=${user}`;
	
	connection.query(sql,(err,result)=>{
		if(err){
			//throw err;
			res.send('{"error":"no_result"}');
		}
		if(result.length > 0) {
			res.json(result);
		}
		else {
			res.send('{"error":"no_result"}');
		}
	});
});


// [ SERVER PORT ] --------------------------------------------------------------------------
app.listen(port, () => {
	console.log(`Listening at http://localhost:${port}`)
})




