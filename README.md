# parse-nasr-data

> Work in progress.

## Goal

This is a work in progress. The long-term goal of this project is to use Ruby
to parse the 56 Day NASR Subscription Data and create logical Ruby objects out
of everything contained therein.

The short term goal is to parse a few of the available fields in order to
produce data for the [airports-api][1].

## Source Data

Download the [56 Day NASR Subscription Data][2] and put it in the
`./subscription-data` directory.

```
unzip ~/Downloads/56DySubscription_January_05__2017_-_March_02__2017.zip
rsync -av ~/Downloads/56DySubscription_January_05__2017_-_March_02__2017/ ~/Development/parse-nasr-data/subscription-data/
```

[1]: http://github.com/far-almanac/airports-api
[2]: https://nfdc.faa.gov/xwiki/bin/view/NFDC/56+Day+NASR+Subscription
