const mongoose = require("mongoose");

const appartSchema = mongoose.Schema({
    image: { type: String, require: true },
    titre: { type: String, require: true },
    type: { type: String, require: true },
    lieu: { type: String, require: true },
    prix: { type: Number, require: true },
    vendu: { type: Number, require: true },
    id_proprio: { type: String, require: true },
});

module.exports = mongoose.model("Appart", appartSchema);