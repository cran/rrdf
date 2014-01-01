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
### code chunk number 6: tutorial.Rnw:89-95
###################################################
add.triple(store,
  "http://example.org/Subject",
  "http://example.org/Predicate",
  "http://example.org/AnotherObject"
)
summarize.rdf(store)


###################################################
### code chunk number 7: tutorial.Rnw:101-106
###################################################
add.data.triple(store,
  subject="http://example.org/Subject",
  predicate="http://example.org/Predicate",
  data="Value"
)


###################################################
### code chunk number 8: tutorial.Rnw:112-118
###################################################
add.data.triple(store,
  subject="http://example.org/Subject",
  predicate="http://example.org/Predicate",
  data="Value",
  type="string"
)


###################################################
### code chunk number 9: tutorial.Rnw:126-135
###################################################
store = new.rdf(ontology=FALSE)
add.prefix(store, "idorg", "http://identifiers.org/pubmed/")
add.prefix(store, "bibo", "http://purl.org/ontology/bibo/")
add.data.triple(store,
  "http://identifiers.org/pubmed/23657106",
  "http://purl.org/ontology/bibo/pmid",
  "23657106"
)
cat(asString.rdf(store, format="N3"))


###################################################
### code chunk number 10: tutorial.Rnw:140-147
###################################################
store = fromString.rdf(paste(
  "<http://example.org/Subject>",
  "<http://example.org/Predicate>",
  "<http://example.org/AnotherObject>",
  "."
), format="N-TRIPLES");
summarize.rdf(store)


###################################################
### code chunk number 11: tutorial.Rnw:155-157
###################################################
tmpfile = tempfile(fileext=".rdfxml")
save.rdf(store, tmpfile)


###################################################
### code chunk number 12: tutorial.Rnw:163-165
###################################################
save.rdf(store, tempfile(fileext=".ardfxml"), format="RDF/XML-ABBREV")
save.rdf(store, tempfile(fileext=".n3"), format="N3")


###################################################
### code chunk number 13: tutorial.Rnw:170-173
###################################################
add.prefix(store, "ex", "http://example.org/")
add.prefix(store, "xsd", "http://www.w3.org/2001/XMLSchema#")
save.rdf(store, tempfile(fileext=".n3"), format="N3")


###################################################
### code chunk number 14: tutorial.Rnw:217-219
###################################################
exData = load.rdf("ex.n3", format="N3")
summarize.rdf(exData)


###################################################
### code chunk number 15: tutorial.Rnw:236-244
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
### code chunk number 16: tutorial.Rnw:250-259
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


