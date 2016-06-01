library itmap {
    struct entry {
        // Equal to the index of the key of this item in keys, plus 1.
        uint keyIndex;
        uint value;
    }

    struct itmap {
        mapping(uint => entry) data;
        uint[] keys;
    }
    
    function insert(itmap storage self, uint key, uint value) internal returns (bool replaced) {
        entry storage e = self.data[key];
        e.value = value;
        if (e.keyIndex > 0) {
            return true;
        } else {
            e.keyIndex = ++self.keys.length;
            self.keys[e.keyIndex - 1] = key;
            return false;
        }
    }
    
    function remove(itmap storage self, uint key) internal returns (bool success) {
        entry storage e = self.data[key];
        if (e.keyIndex == 0)
            return false;
        
        if (e.keyIndex < self.keys.length) {
            // Move an existing element into the vacated key slot.
            self.data[self.keys[self.keys.length - 1]].keyIndex = e.keyIndex;
            self.keys[e.keyIndex - 1] = self.keys[self.keys.length - 1];
            self.keys.length -= 1;
            delete self.data[key];
        }
    }
    
    function contains(itmap storage self, uint key) internal returns (bool exists) {
        return self.data[key].keyIndex > 0;
    }
    
    function size(itmap storage self) internal returns (uint) {
        return self.keys.length;
    }
    
    function get(itmap storage self, uint key) internal returns (uint value) {
        return self.data[key].value;
    }
    
    function getKey(itmap storage self, uint idx) internal returns (uint value) {
        return self.keys[idx];
    }
}
