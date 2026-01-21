// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;
contract upload{
    struct access{
        address user;
        bool access;
    }
    mapping(address=>string[])value;
    mapping(address=>mapping(address=>bool))ownership;
    mapping(address=>access[])accesslist;
    mapping(address=>mapping(address=>bool))previousdata;
    function add(address user,string memory url)external{
value[user].push(url);
    }
   function allow(address user) external {//def
      ownership[msg.sender][user]=true; 
      if(previousdata[msg.sender][user]){
         for(uint i=0;i<accesslist[msg.sender].length;i++){
             if(accesslist[msg.sender][i].user==user){
                  accesslist[msg.sender][i].access=true; 
             }
         }
      }else{
          accesslist[msg.sender].push(access(user,true));  
          previousdata[msg.sender][user]=true;  
      }
    
  }
   function disallow(address user) public{
      ownership[msg.sender][user]=false;
      for(uint i=0;i<accesslist[msg.sender].length;i++){
          if(accesslist[msg.sender][i].user==user){ 
              accesslist[msg.sender][i].access=false;  
          }
      }
  }
  function display(address user)external view returns(string[] memory ){
     require(user==msg.sender || ownership[user][msg.sender],"You don't have access");
      return value[user];
  }
  function shareAccess() public view returns(access[] memory){
      return accesslist[msg.sender];
  }
}