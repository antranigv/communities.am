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
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <!--
        <style type="text/css">
          @charset "utf-8";
          body {
            background:white url("/haruhiism@2x.png") fixed bottom right no-repeat;
            background-size:140px 149px;
            border-top:10px solid #2a9c27;
            color:black;
            font:1em "Helvetica Neue","Liberation Sans",Arial,sans-serif;
            line-height:24px;
            margin:0;
            overflow-y:scroll;
            padding:40px 40px 200px 40px
          }
          h1      { letter-spacing:-1px }
          a       { color:#036ad3 }
          a:hover { text-decoration:none }
          li      { list-style-type:disc }
          summary { 
            cursor:pointer;   /* indicate that it can be clicked on */
            font-weight:bold;
            line-height:26px;
          }
          summary:hover { background-color:rgba(3,106,211,0.1) }
          summary:focus { outline: 0 }
          /* Dave Winer's XML icon, approximated in CSS */
          .rss { 
            background:cornsilk;
            border:1px outset cornsilk;
            color:#ff6600;
            display:inline-block;
            font-size:10px;
            font-weight:bold;
            line-height:10px;
            margin-right:0.6em;
            padding:1px 6px;
            text-decoration:none;
          }
          .rss:hover {
            border:1px outset #ff6600;
            background-color:#ff6600;
            border:1px solid #8d3901;
            border-top-color:#ffbb8f;
            border-left-color:#ffbb8f;
            color:white;
          }

          /* Retina-grade displays */
          @media (min-resolution: 144dpi) {
            background-image:url("/haruhiism@2x.png");
            background-size:140px 149px;
          }

          /* Dark mode displays */
          @media (prefers-color-scheme: dark) {
            body { 
              background-color:black;
              border-top:10px solid maroon;
              color:darkgrey
            }
            summary:hover { background: midnightblue }
            h1,summary { color:white }
            a { color:skyblue }
          }
        </style>
        -->
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
          }
        </style>
      </head>
      <body>
        <h1><span class='at arm'><xsl:value-of select="head/title"/></span></h1>
        <xsl:apply-templates select="body/outline"/>
      </body>
    </html>
  </xsl:template>
  <!--
  <xsl:template match="outline">
    <xsl:choose>
      <xsl:when test="@type">
        <xsl:choose>
          <xsl:when test="@xmlUrl">
            <li>
              <a class="rss" href="{@xmlUrl}">XML</a>
                <xsl:choose>
                  <xsl:when test="@htmlUrl">
                    <a href="{@htmlUrl}"><xsl:value-of select="@text"/></a>
                  </xsl:when>
                  <xsl:otherwise>
                    <a href="{@xmlUrl}"><xsl:value-of select="@text"/></a>
                  </xsl:otherwise>
                </xsl:choose>
            </li>
          </xsl:when>
          <xsl:otherwise>
            <li>
              <a href="{@url}"><xsl:value-of select="@text"/></a>
            </li>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
  -->
          <!-- Check if there are any child elements that will need expanding -->
          <!--
          <xsl:when test="*">
          -->
            <!-- Create permalink, removing the emoji -->
            <!--
            <xsl:variable name="Permalink" select="translate(@text,$uppercase,$lowercase)" />
            <details id="{$Permalink}">
              <summary>
                <xsl:value-of select="@text"/>
              </summary>
              <ul>
                <xsl:apply-templates select="outline"/>
              </ul>
            </details>
          </xsl:when>
          <xsl:otherwise>
            <li>
              <xsl:value-of select="@text"/>
            </li>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
            -->
</xsl:stylesheet>
