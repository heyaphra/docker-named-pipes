const shell = require("./shell");

const pipePath = "/host-pipe/output.txt";

shell(`echo "hello from docker!" > ${pipePath}`);
