pragma solidity ^0.4.18;

contract Assembly {
    function nativeLoop() public pure returns (uint _r) {
        for (uint i = 0; i < 10; i++) {
            _r++;
        }                
    }

    function asmLoops() public returns (uint _r) {
        assembly {
            let i := 0
            loop:
            i := add(i, 1)
            _r := add (i, _r)
            jumpi(loop, lt(i,10))
        }
    }

    function nativeConditional(uint _v) public pure returns (uint) {
        if (5 == _v) {
            return 55;
        } else if (6 == _v) {
            return 66;
        }         
        return 11;
    }

    function asmCondition(uint _v) public returns (uint _r) {
        assembly{
            switch _v
            case 5 {
                _r := 55
            }
            case 6 {
                _r := 66
            }
            default {
                _r := 11
            }
        }
    }

    function asmReturns( uint _v) public returns (uint){
        assembly{
            let _ptr := add(msize(),1)
            mstore(_ptr, _v)
            return (_ptr, 0x20)
        }
    }
}