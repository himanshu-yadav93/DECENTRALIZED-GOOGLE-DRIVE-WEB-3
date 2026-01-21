require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  networks: {
    lineaSepolia: {
      url: "https://linea-sepolia.infura.io/v3/9ede0b9d90954f04bc570605ce0772f9",
      // Accounts must be an array of strings
      accounts: ["da87814259c3256fbfa7086b82275151d6233baa5990ca41e6e4377855971fde"],
      chainId: 59141,
    },
  },
  paths: {
    // This moves compiled JSON files to your frontend folder
    artifacts: "./client/src/artifacts",
  },
};
