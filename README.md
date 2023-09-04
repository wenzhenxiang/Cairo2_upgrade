# Cairo2_upgrade
We use OZ’s library to upgrade smart contracts

### Add dependencies

Code Path

OpenZeppelin dependency needs to be added, which can be linked or downloaded locally.

Scarb.toml Configuration

```bash
[package]
name = "upgrade"
version = "0.1.0"

# See more keys and their definitions at <https://docs.swmansion.com/scarb/docs/reference/manifest.html>

[dependencies]
# foo = { path = "vendor/foo" }
#openzeppelin = { git = "<https://github.com/OpenZeppelin/cairo-contracts.git>", tag = "v0.7.0-rc.0" }
openzeppelin = { path = "/home/ubuntu/bitcoin/cairo_projects/cairo-contracts" }

starknet = ">=2.1.0"

[[target.starknet-contract]]

```

### Declare Upgradeable Contract

`starkli declare target/dev/upgrade_Upgrade.sierra.json --network=goerli-1 --compiler-version=2.1.0`

Returns:

```bash
WARNING: you're using the sequencer gateway instead of providing a JSON-RPC endpoint. This is strongly discouraged. See <https://book.starkli.rs/providers> for more details.
Enter keystore password:
Declaring Cairo 1 class: 0x05c22cfbdc507ca5b1ad961aca9689c5e38fbb49651e0aca212cca595080dfb4
Compiling Sierra class to CASM with compiler version 2.1.0...
CASM class hash: 0x036941cebc6acd9e8f029a5a635596f691e1419f2c95959f2492a85db7673ef5
Contract declaration transaction: 0x07194923f06a45b6781c500fa62897e147d592fc2520a6e7c4ddaccfed2b6e1c
Class hash declared:
0x05c22cfbdc507ca5b1ad961aca9689c5e38fbb49651e0aca212cca595080dfb4

```

### Deploy Upgradeable Contract

`starkli deploy 0x05c22cfbdc507ca5b1ad961aca9689c5e38fbb49651e0aca212cca595080dfb4 --network=goerli-1`

```bash
WARNING: you're using the sequencer gateway instead of providing a JSON-RPC endpoint. This is strongly discouraged. See <https://book.starkli.rs/providers> for more details.
Enter keystore password:
Deploying class 0x05c22cfbdc507ca5b1ad961aca9689c5e38fbb49651e0aca212cca595080dfb4 with salt 0x0220c77a210abec5303a48f5c47c1989e171758b23622c48307d396c42ea9ab8...
The contract will be deployed at address 0x07dd4b89a119206e01f4f4cb3f956c94b5bc2022f549013e660733c3e5f74487
Contract deployment transaction: 0x00aaa5a571180dbf10c70b725089e75face216bf05639dac79ad21e2cf085136
Contract deployed:
0x07dd4b89a119206e01f4f4cb3f956c94b5bc2022f549013e660733c3e5f74487

```

### Declare Another Test Upgradeable Contract

`starkli declare target/dev/upgrade_upgrade_upgrade_test_Upgrade.sierra.json --network=goerli-1 --compiler-version=2.1.0`

```bash
WARNING: you're using the sequencer gateway instead of providing a JSON-RPC endpoint. This is strongly discouraged. See <https://book.starkli.rs/providers> for more details.
Enter keystore password:
Declaring Cairo 1 class: 0x01b8858a4cbde25f97e816af944299bcc901da0c40378f9a30f29ecf7cdc298a
Compiling Sierra class to CASM with compiler version 2.1.0...
CASM class hash: 0x036941cebc6acd9e8f029a5a635596f691e1419f2c95959f2492a85db7673ef5
^[Contract declaration transaction: 0x0630ab6d2a697abc768d0364839ef844b1b570f1dd0cf65dc2c19844ca3cbb57
Class hash declared:
0x01b8858a4cbde25f97e816af944299bcc901da0c40378f9a30f29ecf7cdc298a

```

### Invoke Contract Upgrade to Test Contract

`starkli invoke 0x07dd4b89a119206e01f4f4cb3f956c94b5bc2022f549013e660733c3e5f74487 upgrade 0x01b8858a4cbde25f97e816af944299bcc901da0c40378f9a30f29ecf7cdc298a --network=goerli-1`

```bash
WARNING: you're using the sequencer gateway instead of providing a JSON-RPC endpoint. This is strongly discouraged. See <https://book.starkli.rs/providers> for more details.
Enter keystore password:
Invoke transaction: 0x0150c01138ab54a4fd414cf2d70c965524020121a8799b51261f88b8ae1baaf7
ubuntu@VM-0-7-ubuntu:~/bitcoin/cairo_projects/upgrade$

```

The class hash of the corresponding contract has been changed in the browser.

https://testnet.starkscan.co/contract/0x07dd4b89a119206e01f4f4cb3f956c94b5bc2022f549013e660733c3e5f74487
