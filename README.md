# Vanity Numbers

This repository contains benchmarks for 6 different solutions of vanity number code challenge.

:warning: All solutions were intentionally designed to prevent caching of the dictionary into the memory when we do multiple searches, as I was primarilly interested about `cold` start of the script. :warning:

### Requirements

Ruby 3

### Setup

```sh
bundle install # install gems
```

```sh
./benchmark 2 # run a benchmark for 2 vanity numbers
```


### Solutions

#### Solution 1

Iterates over every word in dictionary and calculates its `Number` representation. If calculated number and number we are looking for are equal, it push the word to `words` array.


#### Solution 2

Loads dictionary file into the memory. Builds `hash` structure where all words are grouped by its `Number` representation.

```ruby
{
  "966" => ["won", "woo", "yom", "yon", "zoo"]
}
```

Finding words is then simple read from the `hash`


#### Solution 3

Pre-process dictionary file by splitting it into the smaller chunks. Groups all words by its first letter `Number` representation.

Finding all words then happen same way as in `solution 1`, but it is way more faster because it does not need to iterate over whole dictionary.


#### Solution 4

Similar to solution 1, but speeds up the matching algorithm by adding extra condition to check `Number`representation of first letter of the word.

#### Solution 5

Pre-process dictionary file and stores it as `json` file where all words are grouped by its `Number` representation. When searching for matching words, it first loads `json` file to the memory and transform it to hash. Then it simply fetch the appropriate key.

#### Solution 6

Pre-process dictionary file by putting all related words to the same line. Finding all words then means to iterate over file lines as in `solution1`, match first occurency and return whole line.


## Benchmark results

```
       user     system      total        real
Solution1  2.375584   0.007557   2.383141 (  2.383282)
Solution2  2.986630   0.023007   3.009637 (  3.009674)
Solution3  0.527724   0.002989   0.530713 (  0.530761)
Solution4  0.721435   0.003379   0.724814 (  0.724823)
Solution5  0.346622   0.006991   0.353613 (  0.353634)
Solution6  0.508624   0.011357   0.519981 (  0.519987)
```

The fastest solution in our case is `Solution5`. Which might be caused by usage of `oj` JSON serializer which is known for its great performance.

Second and third are solutions `6` and `3`, but theirs performance might vary based on the numbers we are searching for.

The worst solution in this case seems to be solution `2` , which loads whole file into memory and transform it into the hash.
