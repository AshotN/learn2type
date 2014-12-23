module.exports =

  port: 5001
###mongo:
    url: 'mongodb://127.0.0.1:27017/finalv'
    host: '127.0.0.1'
    port: 25
    sessionDb: '***-session'
  
  session:
    secret: 'b1d8d68e863cbbf5b6eac491ad52972d2e8559369c34a5add78913eab3d9fa3d'
    key: 'express.sid'
    db: 'mongodb://127.0.0.1:27017/****-session'
    auto_reconnect: true

###