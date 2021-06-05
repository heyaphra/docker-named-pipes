const { spawn } = require("child_process");

module.exports = function (cmd, args) {
  return new Promise((resolve, reject) => {
    const sh = spawn(cmd, args);

    sh.stdout.on("data", (data) => {
      console.log(`stdout: ${data}`);
    });

    sh.stderr.on("data", (data) => {
      console.log(`stdout: ${data}`);
    });

    sh.on("close", (code) => {
      resolve(`child process exited with code ${code}`);
    });

    sh.on("error", (err) => {
      reject(err);
    });
  });
};
