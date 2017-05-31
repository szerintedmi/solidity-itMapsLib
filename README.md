# solidity-itMapsLib
Iterable maps library for Ethereum Solidity

NOTE: It's a first pass release, code review is needed and suggestions are welcome!

## Overview
Provides new custom,  iterable map types for different key / value types:
* `itMapUintUint` for uint=>uint maps
* `itMapAddressUint` for address=>uint maps
* `itMapUintAddress` for uint=>address maps
* `itMapUintBool` for uint=>bool maps

## Use
### Import
```
import "./itMapsLib.sol"
// Use itMaps for all functions on the struct
using itMaps for itmap.itMapUintUint;
using itMaps for itmap.itMapAddressUint;
using itMaps for itmap.itMapUintAddress;
using itMaps for itmap.itMapUintBool;
 ```

### Examples
```
// Example variable declarations
itMaps.itMapUintUint im_myUintUintMap;
itMaps.itMapAddressUint im_myAddressUintMap;
itMaps.itMapUintAddress im_myUintAddressMap;
itMaps.itMapUintBool im_myUintBoolMap;
```
* Insert

`im_myUintUintMap.insert( <uint key>, <uint value>);`

* Return item value by item key

`im_myUintUintMap.get(<uint key>);`

* Check if key exists in map - returns true if it does

`im_myUintUintMap.contains(<uint key);`

* Get size of the map

`im_myUintUintMap.size();`

* Get item key by mapping index

`im_myUintUintMap.getKeyByIndex(<uint idx>);`

* Get item value by mapping index

`im_myUintUintMap.getValueByIndex(<uint idx>);`

* Remove an item from map - returns true if item was in map

`im_myUintUintMap.remove(<uint key>);`

* Delete all mapping and array. NOTE: it iterates thourgh on all items.

`im_myUintUintMap.destroy();`

* TODO: deletes all mapping and sets array lenght to 0 (doesn't free up array storage)

`im_myUintUintMap.clear(); // not yet implemented`

## Storage considerations
TODO: some explanation about ethereum storage considerations/implications

## Testing
TODO: write unit tests

## Contributing
Pull requests are more than welcome. Code review, optimalisation, storage improvements, new mapping types, structure, unit tests etc.

## Authors
* Initial [itmap.sol gist](https://gist.github.com/Arachnid/59159497f124fdbff14bc2ca960b77ba) for uint=>uint map by [Arachnid](https://gist.github.com/Arachnid)
* Improvements in [itmap.sol gist](https://gist.github.com/ethers/7e6d443818cbc9ad2c38efa7c0f363d1) by [Ethers](https://gist.github.com/ethers)
* Improvements, additions in [itMapsLib.sol]() and added to this repo by [Szerintedmi](https://github.com/szerintedmi)

    New mapping types, additional getters, README.md, naming consitency, destroy function

## Licence
This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details.

WARNING: original gists didn't have any licence. Permission is pending from original authors.
