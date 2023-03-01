const Appart = require("../models/modelAppart");
const User = require("../models/modelUser");
const { v4: uuidv4 } = require("uuid");
const jwt = require("jsonwebtoken");

exports.createUser = (req, res, next) => {
    delete req.body._id;
    let user = new User({
        ...req.body,
    });
    let identifier = uuidv4();
    let myReq =
        "INSERT INTO user (id_user, user_name, user_phone, user_email, user_password) VALUES( ?, ?, ?, ? , ?)";
    let datas = [identifier, user.nom, user.numero, user.email, user.password];
    req.getConnection((erreur, connection) => {
        if (erreur) {
            res.status(500).json({ message: erreur });
        } else {
            connection.query(myReq, datas, (erreur) => {
                if (erreur) {
                    res.status(400).json({ message: erreur });
                } else {
                    res.status(201).json({ message: "utilisateur crée avec succès !!!" });
                }
            });
        }
    });
};

exports.createAppart = (req, res, next) => {
    delete req.body._id;
    let appart = new Appart({
        ...req.body,
    });

    let myReq =
        "INSERT INTO apparts (image, titre, type, lieu, prix, vendu, id_proprio) VALUES (?, ?, ?, ?, ?, ?, ?)";

    let datas = [
        appart.image,
        appart.titre,
        appart.type,
        appart.lieu,
        appart.prix,
        appart.vendu,
        appart.id_proprio,
    ];

    req.getConnection((erreur, connection) => {
        if (erreur) {
            console.log(erreur);
        } else {
            connection.query(myReq, datas, (erreur) => {
                if (erreur) {
                    console.log(erreur);
                } else {
                    res.status(201).json({ message: "bien immobilié ajouté" });
                }
            });
        }
    });
};

exports.deleteAppart = (req, res, next) => {
    let myReq = "DELETE FROM apparts WHERE id_appart = " + req.params.id;
    req.getConnection((erreur, connection) => {
        if (erreur) {
            console.log(erreur);
        } else {
            connection.query(myReq, (erreur, resultat) => {
                if (erreur) {
                    console.log({
                        message: "impossible de supprimer le bien",
                        error: erreur,
                    });
                } else {
                    res.status(201).json({ message: "bien immobilié supprimé" });
                }
            });
        }
    });
};

exports.userConnexion = (req, res, next) => {
    let myReq = "SELECT * FROM user WHERE user_email = ? AND user_password = ?";
    let datas = [req.body.email, req.body.password];
    req.getConnection((erreur, connection) => {
        if (erreur) {
            res.status(501).json({ message: erreur });
        } else {
            if ((req.body.email, req.body.password)) {
                connection.query(myReq, datas, (erreur, resultat) => {
                    if (erreur) {
                        res.status(400).json({ message: erreur });
                    } else {
                        if (resultat.length == 1) {
                            res.status(200).json({
                                userId: resultat[0].id_user,
                                userName: resultat[0].user_name,
                                userPic: resultat[0].pic,
                                userRole: resultat[0].role,
                                token: jwt.sign({ userId: resultat[0].id_user },
                                    "RANDOM_TOKEN_SECRET", { expiresIn: "10m" }
                                ),
                            });
                        } else {
                            res.status(400).json({ message: "utilisateur non trouvé" });
                        }
                    }
                });
            }
        }
    });
};

exports.getProprio = (req, res, next) => {
    let myReq = "SELECT * FROM proprio WHERE id_proprio = " + req.params.id;
    req.getConnection((erreur, connection) => {
        if (erreur) {
            res.status(501).json({ message: erreur });
        } else {
            connection.query(myReq, (erreur, resultat) => {
                if (erreur) {
                    res.status(400).json({ message: erreur });
                } else {
                    res.status(200).json({
                        resultat,
                    });
                }
            });
        }
    });
};

exports.getComments = (req, res, next) => {
    let myReq = "SELECT * FROM commentaire INNER JOIN user ON commentaire.idUser = user.id_user WHERE commentaire.idBien = " + req.params.id;
    req.getConnection((erreur, connection) => {
        if (erreur) {
            res.status(501).json({ message: erreur });
        } else {
            connection.query(myReq, (erreur, resultat) => {
                if (erreur) {
                    res.status(400).json({ message: erreur });
                } else {
                    res.status(200).json({
                        resultat,
                    });
                }
            });
        }
    });
};

exports.createComment = (req, res, next) => {
    delete req.body._id;
    let identifier = uuidv4();
    let comment = {
        id: identifier,
        idUser: req.body.idUser,
        idBien: req.body.idBien,
        content: req.body.content,
        likes: 0
    };
    let datas = [comment.id, comment.idUser, comment.idBien, comment.content, comment.likes];

    let myReq =
        "INSERT INTO commentaire (id_comment, idUser, idBien, content, nb_likes) VALUES (? ,?, ?, ?, ?)";
    req.getConnection((erreur, connection) => {
        if (erreur) {
            res.status(500).json({ message: erreur });
        } else {
            connection.query(myReq, datas, (erreur, resultat) => {
                if (erreur) {
                    res.status(400).json({ message: erreur });
                } else {
                    res.status(201).json({ message: comment });
                }
            });
        }
    });
};