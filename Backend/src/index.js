require("dotenv").config()
const port = process.env.PORT || 8080
const path = require("path");
const { app } = require("./app");

app.listen(port, () => {
  console.log(`process.env.PORT: ${process.env.PORT}`)
  console.log(`Server running on port ${port}`)
})

app.get("/api", (req, res) => {
  console.log("GET /api")
  res.json({ message: "Hello from server!" });
})

app.get("*", (req, res) => {
  res.sendFile(path.join(__dirname, "..", "build", "index.html"));
})