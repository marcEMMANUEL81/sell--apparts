const mongoose = require("mongoose");
const uniqueValidator = require('mongoose-unique-validator');

const proprioSchema = mongoose.Schema({
    nom: { type: String, require: true },
    numero: { type: String, require: true },
    email: { type: String, require: true, unique: true },
    password: { type: String, require: true },
});

proprioSchema.plugin(uniqueValidator);

module.exports = mongoose.model("Proprio", proprioSchema);