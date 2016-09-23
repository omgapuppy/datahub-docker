### Logentries DataHub 1.2.0.700 Dockerized

Usage:

* Create a local datahub configuration file `datahub.config` with following contents:

```
{
  "reporter": {
    "user_key": "YOUR LOGENTRIES ACCOUNT KEY HERE",
    "interval": 3,
    "token": "not used"
  },
  "backend": {
    "encrypt_s3_logs": false,
    "amazon_s3_account_id": "",
    "amazon_s3_bucket": "",
    "amazon_s3_encryption_key_file": "",
    "amazon_s3_secret_key": "",
    "local_path": "logs"
  },
  "logging": {
    "default": {
      "logInterval": 1,
      "logLocally": false,
      "sendToLogentries": true
    },
    "heartbeat": {
      "logInterval": 5,
      "logLocally": false,
      "sendToLogentries": true
    },
    "system-stats": {
      "logInterval": 5,
      "logLocally": false,
      "sendToLogentries": true
    }
  },
  "rules": [{
    "pattern":".*"
  }]
}
```

* Then run the container, pointing to local config file:

```
docker run \
    -v /path/to/local/datahub.config:/etc/datahub/datahub.config \
    -p 10000:10000 \
    -p 4242:4242
```

Similarly, whole config path can be linked as a volume `-v` in the container, if further modifications to config are needed.