all:
	awk 'NR==2{print "<?xml-stylesheet type=\"text/xsl\" media=\"screen\" href=\"opml.xsl\"?>"}1' index.opml > index_awked.opml
	sed -i '' -e '/ownerName/d' -e '/ownerId/d' -e '/urlUpdateSocket/d' index_awked.opml
	mv index_awked.opml index.opml
	xsltproc -o index.html opml.xsl index.opml
