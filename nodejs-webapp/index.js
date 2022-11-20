const express = require('express')
var bodyParser = require('body-parser');
const app = express()
const path = require('path');
var indexRouter = require('./routes/index');
var databaseConnection = require('./db/index');
app.use(express.json());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
// app.use(express.static(path.join(__dirname,'public')));
app.use(express.static('public'));
// app.use('/', indexRouter);
app.use("/", indexRouter);

app.use('/', (req, res) => {
	res.sendFile(path.join(__dirname, 'index.html'));
});

// app.use('/student', (req, res) => {
// 	res.sendFile(path.join(__dirname, './public/student.html'));
// });


                          const port = 3000;
                          app.listen(port, () => console.log(`🚀 Listening on port ${port}...`));
                          
  