const express = require("express");
const auth = require("../middleware/auth");
const router = express.Router();
const appartController = require("../controllers/controller");

router.post("/addApparts", auth, appartController.createAppart);
router.delete("/deleteApparts/:id", auth, appartController.deleteAppart);
router.post("/createUser", appartController.createUser);
router.post("/userConnexion", appartController.userConnexion);
router.get("/getProprio/:id", appartController.getProprio);
router.get("/getComments/:id", appartController.getComments);
router.post("/createComment", appartController.createComment);

module.exports = router;