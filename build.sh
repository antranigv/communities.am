#!/bin/sh

xsltproc -o index.html opml.xsl index.opml
pandoc -s todo.md -o todo.html
