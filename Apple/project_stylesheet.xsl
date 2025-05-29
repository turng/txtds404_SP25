<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:template match="tei:TEI"> 
        <html>
            <head>
                <Title>How to Cook Potatoes, Apples, Eggs, Fish, Four Hundred Different
                    Ways</Title>
            </head>
            <body>
                <xsl:apply-templates select="//tei:body"/>
            </body>
        </html>
    </xsl:template>  
    
    <xsl:template match="tei:div[@type='chaptertitle']">
        <h1><xsl:apply-templates/></h1>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='recipe'][@n='115']">
        <div><xsl:apply-templates/></div>
    </xsl:template>
</xsl:stylesheet> 