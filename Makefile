all:
	awk 'NR==2{print "<?xml-stylesheet type=\"text/xsl\" media=\"screen\" href=\"opml.xsl\"?>"}1' c.opml > c_awked.opml
	mv c_awked.opml c.opml
