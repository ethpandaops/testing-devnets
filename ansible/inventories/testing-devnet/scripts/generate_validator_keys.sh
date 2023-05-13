#!/bin/bash

if [ -z "$VALIDATORS_MNEMONIC_0" ]; then
  echo "missing mnemonic 0"
  exit 1
fi

OUTPUT_DIR=../files/validator_keys
mkdir -p $OUTPUT_DIR
PRYSM_WALLET_PASSWORD="prysm"
echo $PRYSM_WALLET_PASSWORD > ../files/validator_keys/prysm_wallet_pass.txt
function prep_group {
  let group_base=$1
  validators_source_mnemonic="$2"
  let offset=$3
  let keys_to_create=$4
  naming_prefix="$5"
  validators_per_host=$6
  echo "Group base: $group_base"
  for (( i = 0; i < keys_to_create; i++ )); do
    let node_index=group_base+i
    let offset_i=offset+i
    let validators_source_min=offset_i*validators_per_host
    let validators_source_max=validators_source_min+validators_per_host

    echo "writing keystores for host $naming_prefix-$node_index: $validators_source_min - $validators_source_max"
    eth2-val-tools keystores \
    --insecure \
    --prysm-pass="$PRYSM_WALLET_PASSWORD" \
    --out-loc="$OUTPUT_DIR/$naming_prefix-$node_index" \
    --source-max="$validators_source_max" \
    --source-min="$validators_source_min" \
    --source-mnemonic="$validators_source_mnemonic"
  done
}

#prep_group 1 "$VALIDATORS_MNEMONIC_0" 0 69 "lighthouse-geth" 2000
#prep_group 1 "$VALIDATORS_MNEMONIC_0" 69 12 "lighthouse-besu" 2000
#prep_group 1 "$VALIDATORS_MNEMONIC_0" 81 21 "lighthouse-nethermind" 2000
#prep_group 1 "$VALIDATORS_MNEMONIC_0" 102 12 "lighthouse-erigon" 2000
#prep_group 1 "$VALIDATORS_MNEMONIC_0" 114 69 "prysm-geth" 2000
#prep_group 1 "$VALIDATORS_MNEMONIC_0" 183 12 "prysm-besu" 2000
#prep_group 1 "$VALIDATORS_MNEMONIC_0" 195 21 "prysm-nethermind" 2000
#prep_group 1 "$VALIDATORS_MNEMONIC_0" 216 12 "prysm-erigon" 2000
#prep_group 1 "$VALIDATORS_MNEMONIC_0" 228 3 "lodestar-geth" 2000
#prep_group 1 "$VALIDATORS_MNEMONIC_0" 231 9 "nimbus-geth" 2000
#prep_group 1 "$VALIDATORS_MNEMONIC_0" 240 3 "nimbus-besu" 2000
#prep_group 1 "$VALIDATORS_MNEMONIC_0" 243 3 "nimbus-nethermind" 2000
#prep_group 1 "$VALIDATORS_MNEMONIC_0" 246 3 "nimbus-erigon" 2000
#prep_group 1 "$VALIDATORS_MNEMONIC_0" 249 30 "teku-geth" 2000
#prep_group 1 "$VALIDATORS_MNEMONIC_0" 279 6 "teku-besu" 2000
#prep_group 1 "$VALIDATORS_MNEMONIC_0" 285 9 "teku-nethermind" 2000
#prep_group 1 "$VALIDATORS_MNEMONIC_0" 294 6 "teku-erigon" 2000
