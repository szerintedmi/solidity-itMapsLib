pragma solidity ^0.4.8;

library itMaps {

    /* itMapUintUint mapping
        KeyIndex uint => Value uint
    */
    struct entryUintUint {
        // Equal to the index of the key of this item in keys, plus 1.
        uint keyIndex;
        uint value;
    }

    struct itMapUintUint {
        mapping(uint => entryUintUint) data;
        uint[] keys;
    }

    function insert(itMapUintUint storage self, uint key, uint value) internal returns (bool replaced) {
        entryUintUint storage e = self.data[key];
        e.value = value;
        if (e.keyIndex > 0) {
            return true;
        } else {
            e.keyIndex = ++self.keys.length;
            self.keys[e.keyIndex - 1] = key;
            return false;
        }
    }

    function remove(itMapUintUint storage self, uint key) internal returns (bool success) {
        entryUintUint storage e = self.data[key];
        if (e.keyIndex == 0)
            return false;

        if (e.keyIndex <= self.keys.length) {
            // Move an existing element into the vacated key slot.
            self.data[self.keys[self.keys.length - 1]].keyIndex = e.keyIndex;
            self.keys[e.keyIndex - 1] = self.keys[self.keys.length - 1];
            self.keys.length -= 1;
            delete self.data[key];
            return true;
        }
    }

    function destroy(itMapUintUint storage self) internal  {
        for (uint i; i<self.keys.length; i++) {
          delete self.data[ self.keys[i]];
        }
        delete self.keys;
        return ;
    }

    function contains(itMapUintUint storage self, uint key) internal constant returns (bool exists) {
        return self.data[key].keyIndex > 0;
    }

    function size(itMapUintUint storage self) internal constant returns (uint) {
        return self.keys.length;
    }

    function get(itMapUintUint storage self, uint key) internal constant returns (uint) {
        return self.data[key].value;
    }

    function getKey(itMapUintUint storage self, uint idx) internal constant returns (uint) {
      /* Decrepated, use getKeyByIndex. This kept for backward compatilibity */
        return self.keys[idx];
    }

    function getKeyByIndex(itMapUintUint storage self, uint idx) internal constant returns (uint) {
      /* Same as decrepated getKey. getKeyByIndex was introduced to be less ambiguous  */
        return self.keys[idx];
    }

    function getValueByIndex(itMapUintUint storage self, uint idx) internal constant returns (uint) {
        return self.data[self.keys[idx]].value;
    }

    /* itMapAddressUint
         address =>  Uint
    */
    struct entryAddressUint {
        // Equal to the index of the key of this item in keys, plus 1.
        uint keyIndex;
        uint value;
    }

    struct itMapAddressUint {
        mapping(address => entryAddressUint) data;
        address[] keys;
    }

    function insert(itMapAddressUint storage self, address key, uint value) internal returns (bool replaced) {
        entryAddressUint storage e = self.data[key];
        e.value = value;
        if (e.keyIndex > 0) {
            return true;
        } else {
            e.keyIndex = ++self.keys.length;
            self.keys[e.keyIndex - 1] = key;
            return false;
        }
    }

    function remove(itMapAddressUint storage self, address key) internal returns (bool success) {
        entryAddressUint storage e = self.data[key];
        if (e.keyIndex == 0)
            return false;

        if (e.keyIndex <= self.keys.length) {
            // Move an existing element into the vacated key slot.
            self.data[self.keys[self.keys.length - 1]].keyIndex = e.keyIndex;
            self.keys[e.keyIndex - 1] = self.keys[self.keys.length - 1];
            self.keys.length -= 1;
            delete self.data[key];
            return true;
        }
    }

    function destroy(itMapAddressUint storage self) internal  {
        for (uint i; i<self.keys.length; i++) {
          delete self.data[ self.keys[i]];
        }
        delete self.keys;
        return ;
    }

    function contains(itMapAddressUint storage self, address key) internal constant returns (bool exists) {
        return self.data[key].keyIndex > 0;
    }

    function size(itMapAddressUint storage self) internal constant returns (uint) {
        return self.keys.length;
    }

    function get(itMapAddressUint storage self, address key) internal constant returns (uint) {
        return self.data[key].value;
    }

    function getKeyByIndex(itMapAddressUint storage self, uint idx) internal constant returns (address) {
        return self.keys[idx];
    }

    function getValueByIndex(itMapAddressUint storage self, uint idx) internal constant returns (uint) {
        return self.data[self.keys[idx]].value;
    }


    /* itMapUintAddress
         Uint =>  Address
    */
    struct entryUintAddress {
        // Equal to the index of the key of this item in keys, plus 1.
        uint keyIndex;
        address value;
    }

    struct itMapUintAddress {
        mapping(uint => entryUintAddress) data;
        uint[] keys;
    }

    function insert(itMapUintAddress storage self, uint key, address value) internal returns (bool replaced) {
        entryUintAddress storage e = self.data[key];
        e.value = value;
        if (e.keyIndex > 0) {
            return true;
        } else {
            e.keyIndex = ++self.keys.length;
            self.keys[e.keyIndex - 1] = key;
            return false;
        }
    }

    function remove(itMapUintAddress storage self, uint key) internal returns (bool success) {
        entryUintAddress storage e = self.data[key];
        if (e.keyIndex == 0)
            return false;

        if (e.keyIndex <= self.keys.length) {
            // Move an existing element into the vacated key slot.
            self.data[self.keys[self.keys.length - 1]].keyIndex = e.keyIndex;
            self.keys[e.keyIndex - 1] = self.keys[self.keys.length - 1];
            self.keys.length -= 1;
            delete self.data[key];
            return true;
        }
    }

    function destroy(itMapUintAddress storage self) internal  {
        for (uint i; i<self.keys.length; i++) {
          delete self.data[ self.keys[i]];
        }
        delete self.keys;
        return ;
    }

    function contains(itMapUintAddress storage self, uint key) internal constant returns (bool exists) {
        return self.data[key].keyIndex > 0;
    }

    function size(itMapUintAddress storage self) internal constant returns (uint) {
        return self.keys.length;
    }

    function get(itMapUintAddress storage self, uint key) internal constant returns (address) {
        return self.data[key].value;
    }

    function getKeyByIndex(itMapUintAddress storage self, uint idx) internal constant returns (uint) {
        return self.keys[idx];
    }

    function getValueByIndex(itMapUintAddress storage self, uint idx) internal constant returns (address) {
        return self.data[self.keys[idx]].value;
    }

  /* itMapUintBool
       Uint =>  Bool
  */
  struct entryUintBool {
      // Equal to the index of the key of this item in keys, plus 1.
      uint keyIndex;
      bool value;
  }

  struct itMapUintBool {
      mapping(uint => entryUintBool) data;
      uint[] keys;
  }

  function insert(itMapUintBool storage self, uint key, bool value) internal returns (bool replaced) {
      entryUintBool storage e = self.data[key];
      e.value = value;
      if (e.keyIndex > 0) {
          return true;
      } else {
          e.keyIndex = ++self.keys.length;
          self.keys[e.keyIndex - 1] = key;
          return false;
      }
  }

  function remove(itMapUintBool storage self, uint key) internal returns (bool success) {
      entryUintBool storage e = self.data[key];
      if (e.keyIndex == 0)
          return false;

      if (e.keyIndex <= self.keys.length) {
          // Move an existing element into the vacated key slot.
          self.data[self.keys[self.keys.length - 1]].keyIndex = e.keyIndex;
          self.keys[e.keyIndex - 1] = self.keys[self.keys.length - 1];
          self.keys.length -= 1;
          delete self.data[key];
          return true;
      }
  }

  function destroy(itMapUintBool storage self) internal  {
      for (uint i; i<self.keys.length; i++) {
        delete self.data[ self.keys[i]];
      }
      delete self.keys;
      return ;
  }

  function contains(itMapUintBool storage self, uint key) internal constant returns (bool exists) {
      return self.data[key].keyIndex > 0;
  }

  function size(itMapUintBool storage self) internal constant returns (uint) {
      return self.keys.length;
  }

  function get(itMapUintBool storage self, uint key) internal constant returns (bool) {
      return self.data[key].value;
  }

  function getKeyByIndex(itMapUintBool storage self, uint idx) internal constant returns (uint) {
      return self.keys[idx];
  }

  function getValueByIndex(itMapUintBool storage self, uint idx) internal constant returns (bool) {
      return self.data[self.keys[idx]].value;
  }
}
