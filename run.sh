WIKIDUMP_XML=enwiki-20160407-pages-articles.xml.bz2
N_TOP_CATEGORIES=10000

{ java it.unimi.di.wikipedia.categories.CategorySelectionToolchain --help 2>&1 | grep -q "Could not find or load main class"; } && { echo 'Java LlamaFur commands not found. You should compile them and include them in the classpath. Look at the "Compile LlamaFur code" part of readme.md!' ; exit 1; }

java it.unimi.di.wikipedia.parsing.WikipediaCategoryProducer $WIKIDUMP_XML ./ --bzip

java it.unimi.di.wikipedia.categories.CategorySelector categoryPseudotree \
  page2cat.ser pageId2Name.ser catId2Name.ser \
  -e "wiki" -e "categories" -e "main topic classifications" -e "template" -e "navigational box" \
  $N_TOP_CATEGORIES ranked-categories.tsv page2cat.tsv
