import { HardhatRuntimeEnvironment } from "hardhat/types";
import { DeployFunction } from "hardhat-deploy/types";
import { ethers } from "hardhat";

const func: DeployFunction = async (hre: HardhatRuntimeEnvironment) => {
  console.log("EtherWallet deployment starts");

  // Contracts are deployed using the first signer/account by default
  const [ owner ] = await ethers.getSigners();

  const EtherWallet = await ethers.getContractFactory("EtherWallet");
  const etherWallet = await EtherWallet.deploy({ from: owner.address });
  const _ctrAddr = await etherWallet.getAddress();
  const _deployed = etherWallet.deploymentTransaction();
  // const deployResult = await deploy("Dex", {
  //   from: deployer,
  //   log: true,
  // });

  if (_deployed && _ctrAddr) {
    console.log(`
          ----------------------------------------------------------------------------------
          |    Deployment Status  :                                                               
          |       Contract owner  :         ${_deployed.from}      
          |
          |  ------------------------------------------------------------------------------
          |    Contract deployed  :         
          |    EtherWallet                :         ${_ctrAddr}   
          ----------------------------------------------------------------------------------
      `);
  }
};

export default func;
func.id = "deploy_etherWallet_registry"; // id required to prevent reexecution
func.tags = ["EtherWallet"];
