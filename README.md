# phoronix-test-profiles 

Provide additional test profiles that aren't in Phoromatic/PTS repository.


## Usage

### Simple verion:

You can run the test(s) by directly downloading from [OpenBenchmarking repository](http://openbenchmarking.org/user/ljishen)
```bash
phoronix-test-suite benchmark ljishen/[Test]
```

### Advanced version:

1. `cd ~/.phoronix-test-suite/test-profiles/local`

   The path may be different if the benchmark requires root privilege. See [Troubleshooting](#troubleshooting) issue 2.

2. `git clone https://github.com/ljishen/phoronix-test-profiles.git .`

3. Check all local test profiles
   ```bash
   phoronix-test-suite list-available-tests | grep local
   ```

4. Install the selected test(s) (if needed) and proceed to run the test(s), e.g.
   ```bash
   phoronix-test-suite benchmark [Test]
   ```


## Banchmarks

| Banchmark     | Notes                           |
| ------------- |---------------------------------|
| hackbench     | Scheduler benchmark/stress test |
| interbench    | Linux interactivity benchmark <br/><br/> <ul><li>Require root or at least real time privileges.</li><li>Some combinations of option `Benchmark` and  `Load Type` may not produce result as the result value is `0` in the case of message `The test run did not produce a result`. Check the log file in `installed-tests/local/interbench` for more detail.</li></ul> |
| latt          | Simple latency tester that combines multiple processes. <br/><br/> <ul><li>Depend on `MPlayer` with `--nosound` and `--vo` options support.</li></ul> |


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


## Miscellaneous

Tested under Phoronix Test Suite >= v5.2.1 (Khanino)
