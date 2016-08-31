# AA-330 utilites

## Usage:
```
$ aa330_gnuplot.sh < example/r4hdc_dump.txt > example/r4hdc_data.txt
$ aa330_svg.gnuplot < example/r4hdc_data.txt > example/r4hdc.svg
```

## Device commands:
```
 0 | 1-10 MHz
 1 | 10-20 MHz
 2 | 20-30 MHz
 3 | user defined
 4 | 10 m
 5 | 12 m
 6 | 15 m
 7 | 17 m
 8 | 20 m
 9 | 30 m
 : | 40 m
 ; | 80 m
 < | 160 m
```

## Device protocol:
```
 S             # start tag
 01000         # start frequency [kHz]
 30000         # end frequency [kHz]
 03            # frequency step ("01"-250kHz, "02"-100kHz, "03"-10kHz, "04"-1kHz)
 988;064;224   # data (SWR;R;X)
 ...
 272;038;054
 E             # end tag
```

