pragma solidity ^0.4.0;

library Strings {
    
    function concat(string _base, string _value) internal returns (string){
     bytes memory _baseBytes = bytes(_base);
     bytes memory _valueBytes = bytes(_value);
     bytes memory _newValue = new bytes(_baseBytes.length + _valueBytes.length);

     uint i;
     uint j;
     
     for(i=0;i<_baseBytes.length;i++){
         _newValue[j++] = _baseBytes[i];
     }
     
       for(i=0;i<_valueBytes.length;i++){
         _newValue[j++] = _valueBytes[i];
     }
     
     return string(_newValue);
   }
    
    function strpos(string _base, string _value) internal returns (int) {
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);

        assert(_valueBytes.length == 1);        
        
        for(uint i=0;i<_baseBytes.length;i++) {
            if (_baseBytes[i] == _valueBytes[0]) {
                return int(i);
            }
        }
        
        return -1;
    }
    
}

contract TestStrings {
    
    using Strings for string;
    
    function testConcat(string _base) returns (string) {
        return _base.concat("_suffix");
    }
    
    function needleInHaystack(string _base) returns (int) {
        return _base.strpos("t");
    }
}