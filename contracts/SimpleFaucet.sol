pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

// @notice simple faucet to distribute testnet tokens, for testing purpose
contract SimpleFaucet is Ownable{
    
    ERC20 constant public TEN = ERC20(0x56C0369E002852C2570ca0CC3442E26df98E01A2);
    ERC20 constant public IDK = ERC20(0xf32789C480Cd5944AE1539c83e33380439b14bb3);
    ERC20 constant public USDT = ERC20(0x1Ad746307FC56B1eB8627FA2C088Ae320CF13224);
    ERC20 constant public WBTC = ERC20(0xdA4a47eDf8ab3c5EeeB537A97c5B66eA42F49CdA);
    ERC20 constant public WETH = ERC20(0x7624cbE2f83c47Fd6DE8804cD76501845062803F);
    
    uint constant public tenPerRequest = 500e18;
    uint constant public idkPerRequest = 100e8;
    uint constant public usdtPerRequest = 10e6;
    uint constant public wbtcPerRequest = 0.01e8;
    uint constant public wethPerRequest = 1e18;
    
    constructor() public{
       
    }
    
    function request() public{
        uint tenBalance = TEN.balanceOf(address(this));
        uint idkBalance = IDK.balanceOf(address(this));
        uint usdtBalance = USDT.balanceOf(address(this));
        uint wbtcBalance = WBTC.balanceOf(address(this));
        uint wethBalance = WETH.balanceOf(address(this));
        
        if(tenBalance >= tenPerRequest) TEN.transfer(msg.sender, tenPerRequest);
        if(idkBalance >= idkPerRequest) IDK.transfer(msg.sender, idkPerRequest);
        if(usdtBalance >= usdtPerRequest) USDT.transfer(msg.sender, usdtPerRequest);
        if(wbtcBalance >= wbtcPerRequest) WBTC.transfer(msg.sender, wbtcPerRequest);
        if(wethBalance >= wethPerRequest) WETH.transfer(msg.sender, wethPerRequest);
        
    }
    
    function transfer(ERC20 _erc20, address _to, uint _amount) public onlyOwner{
        require(_erc20.balanceOf(address(this)) >= _amount, "balance is not enough");
        
        _erc20.transfer(_to, _amount);
    }
    
}