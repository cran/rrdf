### R code from vignette source 'tutorial.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: tutorial.Rnw:32-33
###################################################
library(rrdf)


###################################################
### code chunk number 2: tutorial.Rnw:48-50
###################################################
ontStore = new.rdf()
store = new.rdf(ontology=FALSE)


###################################################
### code chunk number 3: tutorial.Rnw:56-57
###################################################
store


###################################################
### code chunk number 4: tutorial.Rnw:62-64
###################################################
summarize.rdf(ontStore)
summarize.rdf(store)


###################################################
### code chunk number 5: tutorial.Rnw:77-83
###################################################
add.triple(store,
  subject="http://example.org/Subject",
  predicate="http://example.org/Predicate",
  object="http://example.org/Object"
)
summarize.rdf(store)


###################################################
### code chunk number 6: tutorial.Rnw:89-94
###################################################
add.data.triple(store,
  subject="http://example.org/Subject",
  predicate="http://example.org/Predicate",
  data="Value"
)


###################################################
### code chunk number 7: tutorial.Rnw:100-106
###################################################
add.data.triple(store,
  subject="http://example.org/Subject",
  predicate="http://example.org/Predicate",
  data="Value",
  type="string"
)


###################################################
### code chunk number 8: tutorial.Rnw:114-116
###################################################
tmpfile = tempfile(fileext=".rdfxml")
save.rdf(store, tmpfile)


###################################################
### code chunk number 9: tutorial.Rnw:122-124
###################################################
save.rdf(store, tempfile(fileext=".ardfxml"), format="RDF/XML-ABBREV")
save.rdf(store, tempfile(fileext=".n3"), format="N3")


###################################################
### code chunk number 10: tutorial.Rnw:129-132
###################################################
add.prefix(store, "ex", "http://example.org/")
add.prefix(store, "xsd", "http://www.w3.org/2001/XMLSchema#")
save.rdf(store, tempfile(fileext=".n3"), format="N3")


###################################################
### code chunk number 11: tutorial.Rnw:176-178
###################################################
exData = load.rdf("ex.n3", format="N3")
summarize.rdf(exData)


###################################################
### code chunk number 12: tutorial.Rnw:195-203
###################################################
sparql.rdf(exData,
  paste(
    "SELECT ?name ?carbons WHERE {",
    " ?alkane <http://www.w3.org/rdf/schema/#label> ?name ; ",
    " <http://example.org/carbonCount> ?carbons ",
    "}"
  )
) 


###################################################
### code chunk number 13: tutorial.Rnw:209-218
###################################################
sparql.rdf(exData,
  paste(
    "SELECT ?name ?carbons WHERE {",
    " ?alkane <http://www.w3.org/rdf/schema/#label> ?name ; ",
    " <http://example.org/carbonCount> ?carbons ",
    "}"
  ),
  rowvarname="name"
) 


