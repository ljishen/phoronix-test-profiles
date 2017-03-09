# phoronix-test-profiles 

Provide additional test profiles that aren't in Phoromatic/PTS repository.


## How to use

1. `cd ~/.phoronix-test-suite/test-profiles/local`

2. `git clone https://github.com/ljishen/phoronix-test-profiles.git .`

3. Check all local test profiles
   ```bash
   phoronix-test-suite list-available-tests | grep local
   ```

4. Install the selected test(s) (if needed) and proceed to run the test(s), e.g.
   ```bash
   phoronix-test-suite benchmark [Test]
   ```


## Troubleshooting

1. Error message `Downloading of needed test files failed.`
   - Short version: set a default value for the `CURLOPT_CAINFO` option.
   - Longer version: check your `php.ini` and set the [latest CA certificates](https://curl.haxx.se/docs/caextract.html) for `curl.cainfo`, e.g.

     ```ini
     curl.cainfo=/home/$USER/certs/cacert.pem
     ```

1. Error message `This test must be run as the root / administrator account.`

   Some test profiles (e.g. interbench) require to be run as root / `sudo`, so please put the test profile under
   - Ubuntu: `/root/.phoronix-test-suite/test-profiles/local/`
   - Raspbian: `/var/lib/phoronix-test-suite/test-profiles/local/`


## Note

Tested under Phoronix Test Suite >= v5.2.1 (Khanino)
