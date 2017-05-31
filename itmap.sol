pragma solidity ^0.4.8;

library itMaps {
/***********************
 *  Iterable maps:
 *      itmapUintUint for uint=>uint maps
 *      itmapAddressUint for address=>uint maps
 *  Use:
 *      import "./itmaps.sol"
 *      // Use itmap for all functions on the struct
 *      using itmap for itmap.itmapUintUint;
 *      using itmap for itmap.itmapAddressUint;
 *      using itmap for itmap.itmapUintAddress;
 *
 *      // Declare an iterable mapping
 *      itmap.itmapUintUint im_myUintUintMap;
 *      itmap.itmapAddressUint im_myAddressUintMap;
 *      itmap.itmapUintAddress im_myUintAddress;
 *
 *      im_myUintUintMap.insert( <uint key>, <uint value>); 
 *      im_myUintUintMap.get(<uint key>); // returns item uint value by item key
 *      im_myUintUintMap.contains(<uint key); // returns bool true if key is in mapping
 *      im_myUintUintMap.size();  // returns uint size of the map ( for iterating)
 *      im_myUintUintMap.getKeyByIndex(<uint idx>);  // returns item key by mapping index (for iterating)
 *      im_myUintUintMap.getValueByIndex(<uint idx>); //returns item value by mapping index ( for iterating)
 *      im_myUintUintMap.remove(<uint key>); // removes an item from map
 *
 * *********************/

    /* itmapUintUint mapping
        KeyIndex uint => Value uint
    */
    struct entryUintUint {
        // Equal to the index of the key of this item in keys, plus 1.
        uint keyIndex;
        uint value;
    }

    struct itmapUintUint {
        mapping(uint => entryUintUint) data;
        uint[] keys;
    }

    function insert(itmapUintUint storage self, uint key, uint value) internal returns (bool replaced) {
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

    function remove(itmapUintUint storage self, uint key) internal returns (bool success) {
        entryUintUint storage e = self.data[key];
        if (e.keyIndex == 0)
            return false;

        if (e.keyIndex < self.keys.length) {
            // Move an existing element into the vacated key slot.
            self.data[self.keys[self.keys.length - 1]].keyIndex = e.keyIndex;
            self.keys[e.keyIndex - 1] = self.keys[self.keys.length - 1];
            self.keys.length -= 1;
            delete self.data[key];
            return true;
        }
    }

    function contains(itmapUintUint storage self, uint key) internal constant returns (bool exists) {
        return self.data[key].keyIndex > 0;
    }

    function size(itmapUintUint storage self) internal constant returns (uint) {
        return self.keys.length;
    }

    function get(itmapUintUint storage self, uint key) internal constant returns (uint) {
        return self.data[key].value;
    }

    function getKey(itmapUintUint storage self, uint idx) internal constant returns (uint) {
      /* Decrepated, use getKeyByIndex. This kept for backward compatilibity */
        return self.keys[idx];
    }

    function getKeyByIndex(itmapUintUint storage self, uint idx) internal constant returns (uint) {
      /* Same as decrepated getKey. getKeyByIndex was introduced to be less ambiguous  */
        return self.keys[idx];
    }

    function getValueByIndex(itmapUintUint storage self, uint idx) internal constant returns (uint) {
        return self.data[self.keys[idx]].value;
    }


    /* itmapAddressUint
         address =>  Uint
    */
    struct entryAddressUint {
        // Equal to the index of the key of this item in keys, plus 1.
        uint keyIndex;
        uint value;
    }

    struct itmapAddressUint {
        mapping(address => entryAddressUint) data;
        address[] keys;
    }

    function insert(itmapAddressUint storage self, address key, uint value) internal returns (bool replaced) {
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

    function remove(itmapAddressUint storage self, address key) internal returns (bool success) {
        entryAddressUint storage e = self.data[key];
        if (e.keyIndex == 0)
            return false;

        if (e.keyIndex < self.keys.length) {
            // Move an existing element into the vacated key slot.
            self.data[self.keys[self.keys.length - 1]].keyIndex = e.keyIndex;
            self.keys[e.keyIndex - 1] = self.keys[self.keys.length - 1];
            self.keys.length -= 1;
            delete self.data[key];
            return true;
        }
    }

    function contains(itmapAddressUint storage self, address key) internal constant returns (bool exists) {
        return self.data[key].keyIndex > 0;
    }

    function size(itmapAddressUint storage self) internal constant returns (uint) {
        return self.keys.length;
    }

    function get(itmapAddressUint storage self, address key) internal constant returns (uint) {
        return self.data[key].value;
    }

    function getKeyByIndex(itmapAddressUint storage self, uint idx) internal constant returns (address) {
        return self.keys[idx];
    }

    function getValueByIndex(itmapAddressUint storage self, uint idx) internal constant returns (uint) {
        return self.data[self.keys[idx]].value;
    }


    /* itmapUintAddress
         Uint =>  Address
    */
    struct entryUintAddress {
        // Equal to the index of the key of this item in keys, plus 1.
        uint keyIndex;
        address value;
    }

    struct itmapUintAddress {
        mapping(uint => entryUintAddress) data;
        uint[] keys;
    }

    function insert(itmapUintAddress storage self, uint key, address value) internal returns (bool replaced) {
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

    function remove(itmapUintAddress storage self, uint key) internal returns (bool success) {
        entryUintAddress storage e = self.data[key];
        if (e.keyIndex == 0)
            return false;

        if (e.keyIndex < self.keys.length) {
            // Move an existing element into the vacated key slot.
            self.data[self.keys[self.keys.length - 1]].keyIndex = e.keyIndex;
            self.keys[e.keyIndex - 1] = self.keys[self.keys.length - 1];
            self.keys.length -= 1;
            delete self.data[key];
            return true;
        }
    }

    function contains(itmapUintAddress storage self, uint key) internal constant returns (bool exists) {
        return self.data[key].keyIndex > 0;
    }

    function size(itmapUintAddress storage self) internal constant returns (uint) {
        return self.keys.length;
    }

    function get(itmapUintAddress storage self, uint key) internal constant returns (address) {
        return self.data[key].value;
    }

    function getKeyByIndex(itmapUintAddress storage self, uint idx) internal constant returns (uint) {
        return self.keys[idx];
    }

    function getValueByIndex(itmapUintAddress storage self, uint idx) internal constant returns (address) {
        return self.data[self.keys[idx]].value;
    }
}
