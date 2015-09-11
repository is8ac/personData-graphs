## Intro
DBpedia has a data set of ~1,000,000 famous people which contains such information as givenName, surname, birthDate, deathDate etc.
I have been playing with this data set in various ways.

I've also been playing with making network graphs using the igraph R package.

So, the the logical thing to do is to combine the two, and make network graphs of people's names.

Feed igraph an edge list consisting of < givenName>,< surname>, and it gives you a graph where the first and last names are nodes, connected by lines each representing one person.

The two highly detailed images are using the first 20,000 names, from A. A. Englander to Hugh Latimer. This means that first names starting with I-Z are ignored.

igraph includes many algorithms for laying out network graphs nicely.
I am using both the Kamada Kawai algorithm and the Fruchterman Reingold algorithm.


## Node connections
The Alice node will be connected to the Smith node if there exists a person named Alice Smith.
Likewise, the Bob node will be connected to the Smith node if there exists a person names Bob Smith.
If there exist people named both Alice Smith and Bob Smith, then the Alice
node will be indirectly connected to the Bob node within two hops.

As more names are added, groups of connected names form and grow larger.
Eventually all the large groups are connected together in a single group,
and the small groups that failed to connected are left to be pushed to the edges.
When using 20,000 names, the largest I have observed a group becoming while staying separate from the main group, is just 26 names.

### Star and crescent

The Kamada Kawai algorithm and particularly the Fruchterman Reingold
algorithm, try to keep large groups separate from the each other.
The larger the group, the more important it is, and the more it should be separated from other groups.

The names data set contains one extremely large group, and lots of small <=26 groups.

Any time that there is a circle inside a larger circle with lots of little
things filling in the edges, the little things form into a crescent shape.



The R script: https://github.com/is8ac/network-gen
The original data set: http://wiki.dbpedia.org/Downloads2015-04

You can download the full resolution renders below. Warning! The 2^14 renders are 50-60 MB each. They may use 3+ GB of RAM and/or crash you image viewer when you try to display them. They do have the advantage that you can zoom in far enough read the names.


Kamada Kawai algorithm using 500 names rendered at 5000 x 5000. 8.9 MB
https://s3-us-west-2.amazonaws.com/content-isaacleonard.com/person-names-kk.png

Fruchterman Reingold algorithm using 500 names rendered at 5000 x 5000. 7.4 MB
https://s3-us-west-2.amazonaws.com/content-isaacleonard.com/person-names-fr.png

https://s3-us-west-2.amazonaws.com/content-isaacleonard.com/person-names-kk-14-20000.png
Kamada Kawai algorithm using 20,000 names rendered at 2^14 x 2^14. 64MB

Fruchterman Reingold algorithm using 20,000 names rendered at 2^14 x 2^14. 47MB
https://s3-us-west-2.amazonaws.com/content-isaacleonard.com/person-names-fr-14-20000.png

As a derivative work of creative commons data, these images are likewise released under creative commons.
https://creativecommons.org/licenses/by-sa/3.0/
