# Ctrl-C Ctrl-P
Clipboard challenge in a single, gnarly regex
```bash
$ echo "the first[CTRL+C] Coding Challenge was [CTRL+V] string manipulation task" | ./clip.sh
the first Coding Challenge was the first string manipulation task
```

Run tests with
```bash
./test.sh
```

Caveats:
- Cannot use [ in the string anywhere that isn't a command
- Does not support pasting the same thing multiple times. E.g. `the first[CTRL+C] Coding Challenge was [CTRL+V] [CTRL+V] string manipulation task`
