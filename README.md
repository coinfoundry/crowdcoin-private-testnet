## Crowdcoin three-node private network in regtest mode

- Node Pool
  - RPC Port 16001, Username: user, Password: pass
- Node Bob
  - RPC Port 16002, Username: user, Password: pass
- Node Alice
  - RPC Port 16003, Username: user, Password: pass

### Addresses

- Pool:  CULT4yrMRTHoFdG3aQLTinUajkXSi9pagW
- Bob:   CHtFnXkMB9KVoybj5RVSEeBYRUd7d8k4AJ
- Alice: CQprLffKAN9PVvz91gFM1nb3eRRAPR8Tn5

### To run this image with internal ports exposed at host:

```bash
docker run -it -d -p 16301:16001 -p 16302:16302 -p 16303:16003 coinfoundry/crowdcoin-private-testnet
```

### Generating blocks:

```bash
docker exec -i -t <container_id> /usr/bin/crowdcoin-cli -datadir=/data/node-pool generate 1
```

### Example RPC against Node-Pool:

```bash
curl --user user:pass --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getinfo", "params": [] }' -H 'content-type: application/json;' http://127.0.0.1:16001/
```
