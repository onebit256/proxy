pragma solidity ^0.5.3;

import '@openzeppelin/upgrades/contracts/upgradeability/ProxyFactory.sol';

contract StoreFactory is ProxyFactory {
    address public impl;
    address public owner;

    modifier OnlyOwner() {
        require(msg.sender == owner, 'Only Owner');
        _;
    }

    constructor(address _impl, address _owner) public {
        impl = _impl;
        owner = _owner;
    }

    function cloneStore() public OnlyOwner {
        deployMinimal(impl, "");
    }
}