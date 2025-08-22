
const fs = require("fs");
const crypto = require("crypto");

if (process.argv.length < 3) {
  console.log("Usage: node hashFile.js <path-to-file>");
  process.exit(1);
}

const filePath = process.argv[2];
const hash = crypto.createHash("sha256");
const stream = fs.createReadStream(filePath);

stream.on("data", (d) => hash.update(d));
stream.on("end", () => {
  console.log(hash.digest("hex"));
});
