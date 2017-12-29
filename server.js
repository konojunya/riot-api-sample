const express = require("express")
const app = express()
const bodyParser = require("body-parser")

app.use(express.static("public"))
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())

app.get("/", (req, res) => {
  res.sendfile("view/index.html")
})

// data
const articles = {}

// api
app.get("/api/article", (req, res) => {
  res.status(200)
  res.json({ articles })
})
app.post("/api/article", (req, res) => {
  if(req.body.text) {
    res.status(201)
    const id = (Math.floor(Math.random()*999999)).toString(36);
    articles[id] = {
      id,
      text: req.body.text
    }
  }
  res.json({ articles })
})
app.put("/api/article/:id", (req, res) => {
  if(req.body.text){
    res.status(200)
    articles[req.params.id].text = req.body.text
  }
  res.json({ articles })
})
app.delete("/api/article/:id", (req, res) => {
  res.status(200)
  delete articles[req.params.id]
  res.json({ articles })
})

app.listen(3000, () => {
  console.log("start server.\nhttp://localhost:3000")
})