const { Client } = require('pg')

const client = new Client({
  user: 'postgres',
  host: 'localhost',
  database: 'mydatabase',
  password: 'postgres',
  port: 5433,
});

client.connect()

module.exports = client;