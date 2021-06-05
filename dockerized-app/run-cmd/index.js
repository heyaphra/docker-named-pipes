const fs = require("fs");

const pipePath = "/host_pipe/cmd_runner";
const outputPath = "~/repos/docker-named-pipes/output.txt";
const cmd = `echo "this command was executed on the host from the container! > ${outputPath}"`;

const wstream = fs.createWriteStream(pipePath);
wstream.write(cmd);
wstream.close();
