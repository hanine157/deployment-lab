require("dotenv").config();

const express = require("express");

const app = express();

app.get("/", (req, res) => {
    res.send("Hello DevOps 🚀");
});

const PORT = process.env.PORT;

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});