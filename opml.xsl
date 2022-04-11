<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:str="http://exslt.org/strings"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:dcterms="http://purl.org/dc/terms/"
  extension-element-prefixes="str">

<xsl:template match="/opml">
  <html>
    <head>
      <title><xsl:value-of select="head/title"/></title>
      <meta http-equiv="content-type" content="text/html;charset=utf-8" />
      <meta name="HandheldFriendly" content="True"/>
      <meta name="MobileOptimized" content="320"/>
      <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <style>
        body {
        color: #222;
        font-size: 16px;
        font-family: monospace;
        }
        * {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        }
        h1 {
        font-family: 'Trebuchet MS', 'Tahoma', 'Arial', 'Helvetica';
        font-size: 2em;
        margin: 10px;
        text-align: right;
        }
        fieldset {
        border: 1px solid #aaa;
        background-color: #fff;
        max-width: 850px;
        margin: 0 auto;
        margin-bottom: 25px;
        }
        legend {
        background-color: #fff;
        border: 1px solid #aaa;
        padding: 0.25em 1.5em 0.25em 1.5em;
        color: #222;
        }
        fieldset p {
        margin-left: 1em;
        }
        a, a:visited {
        color: #000;
        text-decoration: underline;
        }
        a:hover, a:visited:hover, a:active {
        color: #444;
        text-decoration: underline;
        }
        ul {
        list-style-type: circle;
        color: #333;
        }
        li p {
        color: #222;
        margin-bottom: 0.5em;
        margin-top: 0;
        }
        ul.speaking li {
        list-style: none;
        margin-right: 10px;
        }
        ul.speaking li:nth-child(even)  {
        background-color: rgb(248, 247, 255);
        }
        ul.speaking li:nth-child(odd) {
        background-color: #fff;
        }
        ul.speaking li p span.p {
        margin-left: 10px;
        }
        ul.speaking li p span.v {
        float: right;
        margin-right: 10px;
        color: #222;
        }
        ul.writing li {
        list-style: none;
        margin-right: 10px;
        }
        ul.writing li:nth-child(even)  {
        background-color: rgb(248, 247, 255);
        }
        ul.writing li:nth-child(odd) {
        background-color: #fff;
        }
        ul.writing li p span.p {
        margin-left: 10px;
        }
        ul.writing li p span.v {
        float: right;
        margin-right: 10px;
        color: #222;
        }
        ul.contact li p span.v {
        float: right;
        margin-right: 10px;
        color: #222;
        }
        .at {
        color: #333;
        }
        .footer {
        font-size: 0.8em;
        color: #666;
        text-align: center;
        }
        .arm {font-family: 'Arian Grqi' !important;}
        @font-face {
        font-family: 'Arian Grqi';
        src: url(https://antranigv.am/weblog/fonts/Arian_Grqi_U.eot);
        src: url(https://antranigv.am/weblog/fonts/Arian_Grqi_U.eot) format('embedded-opentype'),
        url(https://antranigv.am/weblog/fonts/Arian_Grqi_U.woff) format('woff'),
        url(https://antranigv.am/weblog/fonts/Arian_Grqi_U.ttf) format('truetype'),
        url(https://antranigv.am/weblog/fonts/Arian_Grqi_U.svg) format('svg');
        font-weight: normal;
        font-style: normal;
        }
        @media (prefers-color-scheme: dark) {
        body {
        background-color:black;
        }
        .at {
        color:#ddd;
        }
        legend {
        background-color:black;
        color:#ddd;
        }
        fieldset {
        background-color:#000;
        }
        li {
        color:#ccc;
        }
        li p {
        color:#ccc;
        }
        a, a:visited {
        color: #ccc;
        text-decoration: underline;
        }
        a:hover, a:visited:hover, a:active {
        color: #ddd;
        text-decoration: underline;
        }
        }
      </style>
    </head>
    <body>
      <h1><span class='at arm'><xsl:value-of select="head/title"/></span></h1>
      <xsl:apply-templates select="body/outline"/>
    </body>
  </html>
</xsl:template>
<xsl:template match="outline">
  <xsl:choose>
    <xsl:when test="@fieldset">
      <fieldset class="arm"><legend><xsl:value-of select="@text"/></legend>
        <ul>
          <xsl:apply-templates select="outline"/>
        </ul>
      </fieldset>
    </xsl:when>
    <xsl:otherwise>
      <li>
        <xsl:choose>
          <xsl:when test="@url">
            <a href="{@url}"><xsl:value-of select="@text"/></a>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="@text"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="*">
            <ul>
            <xsl:apply-templates select="outline"/>
            </ul>
          </xsl:when>
        </xsl:choose>
      </li>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
</xsl:stylesheet>

