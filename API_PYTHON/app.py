from flask import Flask, request, jsonify
from mysql.connector import connect
from flask_cors import CORS, cross_origin

app = Flask(__name__)
CORS(app)
conn = connect(user='root', password='root',
                            host='localhost', database='appart_db', port=8889)
cursor = conn.cursor()

@app.route('/api/apparts/getApparts', methods=['GET'])
@cross_origin(origin='*')
def get_all_table():
    if request.method == "GET":
        cursor.execute("SELECT * FROM apparts")
        rows = cursor.fetchall()
        results = []
        for row in rows:
            results.append({'id_appart': row[0], 'image': row[1], 'titre': row[2],
                       'type': row[3], 'lieu': row[4], 'prix': row[5], 'vendu': row[6], 'id_proprio': row[7]})
        return jsonify({"results": results})
    
@app.route('/api/apparts/getEvents', methods=['GET'])
@cross_origin(origin='*')
def get_all_events():
    if request.method == "GET":
        cursor.execute("SELECT * FROM event")
        rows = cursor.fetchall()
        results = []
        for row in rows:
            results.append({'id': row[0], 'date': row[1], 'action': row[2],
                       'idAppart': row[3], 'nomApart': row[4]})
        return jsonify({"results": results})

@app.route('/api/apparts/getOneAppart/<string:id>', methods=['GET'])
@cross_origin(origin='*')
def get_One_Element(id):
    cursor.execute("SELECT * FROM apparts WHERE id_appart = " + id)
    rows = cursor.fetchall()
    results = []
    for row in rows:
        results.append({'id_appart': row[0], 'image': row[1], 'titre': row[2],
                       'type': row[3], 'lieu': row[4], 'prix': row[5], 'vendu': row[6], 'id_proprio': row[7]})
    return {"results": results}


@app.route('/api/apparts/modifyOneAppart/<string:id>', methods=['PUT'])
@cross_origin(origin='*')
def add_table(id):
    data = request.get_json()
    cursor.execute("UPDATE apparts SET image = %s, titre = %s, type = %s, lieu = %s, prix = %s, vendu = %s WHERE id_appart = " + id,
                   (data['image'], data['titre'], data['type'], data['lieu'], data['prix'], data['vendu']))
    conn.commit()
    return {"message": "table mise à jour"}

if __name__ == '__main__':
    app.run(host='192.168.252.170', port=3001, debug=True)