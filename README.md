# phoronix-test-profiles                                                                                                                                                                                                               

Provide additional test profiles that aren't in Phoromatic/PTS repository.

## How to use

1. `cd ~/.phoronix-test-suite/installed-tests/local`
2. `git clone https://github.com/ljishen/phoronix-test-profiles.git`
3. Check all local test profiles
   ```bash
   phoronix-test-suite list-available-tests | grep local
   ```
4. Install the selected test(s) (if needed) and proceed to run the test(s), e.g.
   ```bash
   phoronix-test-suite benchmark [Test]
   ```

Tested under Phoronix Test Suite >= v6.8.0
