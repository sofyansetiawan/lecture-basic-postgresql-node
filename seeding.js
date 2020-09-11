const fs = require("fs");

const client = require("./config");

const data = fs.readFileSync("./person.csv", "utf-8").split("\n").splice(1);

// * SEEDING BERIKUT INI MEMBUAT DATA TIDAK TERURUT (Karena dijalankan secara Asyncronous). GUNAKAN SEEDING DENGAN LOOPING BIASA UNTUK MEMBENTUK PERINTAH QUERY INSERT BESERTA DATANYA

for(let i = 0; i < data.length; i++){
    let singleData = data[i].split(",");

    const text = 'INSERT INTO car(name, type, employee_id) VALUES($1, $2, $3) RETURNING *';

    const values = singleData;
    client.query(text, values, (err, res) => {
        if (err) {
            console.log(err.stack)
        } else {
            console.log(res.rows[0]);
            client.end();

            // callback hell untuk insert file lain
            // client.query()
        }

    })
}
