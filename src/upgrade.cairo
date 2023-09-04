#[starknet::contract]
mod Upgrade {
    use starknet::ContractAddress;
    use openzeppelin::upgrades::upgradeable::Upgradeable;
    use openzeppelin::upgrades::interface::IUpgradeable;
	use starknet::ClassHash;


    #[storage]
    struct Storage {}


    #[external(v0)]
    impl UpgradeImpl of IUpgradeable<ContractState> {
		fn upgrade(ref self: ContractState, impl_hash: ClassHash) {
             let mut unsafe_state = Upgradeable::unsafe_new_contract_state();
             Upgradeable::InternalImpl::_upgrade(ref unsafe_state, impl_hash);
        }
    }

}
