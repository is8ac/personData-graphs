require(igraph)

# Read in the raw data.
raw <- read.csv("wide-personNames-subset.csv")

edges <- subset(raw, select=c("givenName", "surname"))

# Create the edge list.
edgeList <- graph.data.frame(edges)

power <- 14
size <- 2^power

# Open the graphics device.
png(filename = "person-names-fr-12-500.png", width = 2^12, height = 2^12, bg="black")

    plot.igraph(edgeList,
      layout=layout.fruchterman.reingold,
      #layout=layout.kamada.kawai,
      edge.color="white",
      vertex.label.color="red",
      vertex.label.cex=1.5,
      vertex.size=0.2,
      vertex.color="white",
      main="500 names",
      edge.width=0.8)

dev.off()
