import {
  time,
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";
const _minDeposit = ethers.parseEther("0.1");

describe("EtherWallet", () => {
  const deployContractFixture = async () => {
    const [owner, secondAccount] = await ethers.getSigners();
    const EtherWallet = await ethers.getContractFactory("EtherWallet");
    const etherWallet = await EtherWallet.deploy({ from: owner.address });

    return {
      accounts: { owner, secondAccount },
      contract: {
        etherWallet: etherWallet,
      },
    };
  };

  describe("Deployment", () => {
    it("Should deploy and set the owner to be the deployer address", async () => {
      const { contract, accounts } = await loadFixture(deployContractFixture);
      const _deploymentTx = await contract.etherWallet.deploymentTransaction();
      expect(_deploymentTx?.from).to.equal(accounts.owner.address);
    });
  });
  describe("Deposit", () => {
    it("Should allow any account to deposit and verify balanceOf[msg.sender]", async () => {
      const { contract, accounts } = await loadFixture(deployContractFixture);

      await contract.etherWallet.connect(accounts.secondAccount).deposit({
        value: _minDeposit,
      });
      const _balanceOf = await contract.etherWallet.balanceOf(
        accounts.secondAccount.address
      );
      expect(_balanceOf).to.equal(_minDeposit);
    });
  });
  describe("Withdrawal", () => {});
});
