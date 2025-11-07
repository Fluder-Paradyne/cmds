### Speedtest
```shell
curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -
```

### find files larger than 1GB
```shell
find . -type f -size +1G
```

### curl with timing stats
```shell
curl -s -o /dev/null -w "
  Time to Name Lookup:  %{time_namelookup}s
  Time to Connect:      %{time_connect}s
  Time to First Byte:   %{time_starttransfer}s
  Total Time:           %{time_total}s\n" \
  https://example.com
```