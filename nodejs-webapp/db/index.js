// Set up mongoose connection
const mongoose = require('mongoose');

mongoose.connect("mongodb://localhost:27017/", {
    keepAlive: true,
}).then(() => {
    console.log("Successfully connected to the database");
}).catch(err => {
    console.log('Could not connect to the database. Exiting now...', err);
    process.exit();
});

module.exports = mongoose.connection;