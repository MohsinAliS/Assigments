// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Box {
  
uint public x;

/** 
This function for update varible values */
function setvalue(uint _nb) public{
 x=_nb;
}

/**
This function for get variable value */
function getValue() public view returns(uint){
  return x;
}
}
