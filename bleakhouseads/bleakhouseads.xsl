<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xml:template match="TEI">
        <html>
            <head>
                <title><xsl:apply-templates select="//titleStmt/title"/></title>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xml:template>
    <xml:template match="teiHeader">
        <div>
            <xsl:apply-templates/>
        </div>
    </xml:template>
</xsl:stylesheet>