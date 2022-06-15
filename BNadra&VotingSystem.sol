// SPDX-License-Identifier: MIT
pragma solidity ^0.7.5;
contract NicSystem{

  mapping (uint=>Nadra) public Resitraion;
  mapping (uint => vote) public voting;
  mapping (address =>bool) public voted;

    uint Vid;
  struct vote
  {
    uint cnicId;
    uint familyCode;
    uint suprotToPPP;
    uint suportToPTI;
    string voterAdress;
  } 
    
    uint ID;
  struct Nadra
  {   
    uint nicId;
	  string Name;
	  string FatherName;
    string MotherName;
    string gender;
    string currentAdress;
    uint DateOfBirth;
    uint income;
    uint familyCodeN;
	}
  
  uint public dateIssue;  
  uint public dateExpire;
  function RegisterYourSelf
  (
    uint _nicId,
	  string memory _Name,
	  string memory _FatherName,
    string memory  _MotherName,
    string memory  _gender,
    string memory _currentAdress,
    uint _DateOfBirth,
    uint _income,
    uint _familyCodeN   
  ) public
  {   
    ID=_nicId;
    Resitraion[ID]=Nadra(_nicId,_Name,_FatherName,_MotherName,_gender,_currentAdress,
    _DateOfBirth,_income, _familyCodeN);
    dateIssue=block.timestamp;
    dateExpire=block.timestamp + 1825 days;
  }

  function cheekIdName(uint _nicId) public view returns(string memory)
  {
    return Resitraion[_nicId].Name;
  } 
  
  function SuportingVote(uint _cnicId,uint _familyCode,uint _suportToPPP,uint _suportToPTI,
    string memory _voterAdress) external returns(string memory)
  {
    require(_familyCode== Resitraion[ID].familyCodeN,
    "Your Family code is not registered");
    require(voted[msg.sender]==false,"you are voted");
    require(_suportToPPP ==0 || _suportToPPP==1,"you should suport 0 or 1");
    require(_suportToPTI ==0 || _suportToPTI==1,"you should suport 0 or 1");
    Vid++;
    voting[Vid]=vote(_cnicId,_familyCode, _suportToPPP, _suportToPTI, _voterAdress);
    voted[msg.sender]=true;
    return ("your succesfuly done");
  }
  
  function PartyInpower() public view returns(string memory){
//return voting[Vid].suportToPTI >= voting[Vid].suprotToPPP ? voting[Vid].suportToPTI : voting[Vid].suprotToPPP;
  if (voting[Vid].suportToPTI > voting[Vid].suprotToPPP)
  {
    return"pti win the voting & pti in power";
  }
  else if (voting[Vid].suportToPTI == voting[Vid].suprotToPPP)
  {
    return"both are equrates sapoters so nobody in power ";

  }
  else
  {
    return"ppp win the voting & ppp in power";
  }
  }
  /// Practice BY Mohsin
  }




