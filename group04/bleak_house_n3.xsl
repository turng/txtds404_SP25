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
                <title>Bleak House no. 3</title>
                <link rel="stylesheet" href="css/style.css"/>
            </head>
            <body>
                <xsl:apply-templates select="tei:text"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:front">
        <div class="intro"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="tei:body">
        <div class="body"><xsl:apply-templates/></div>
    </xsl:template>
    
    
    <xsl:template match="tei:div[@type='ad']">
        <div class="ad"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='ad-group']">
        <div class="ad-group"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:p[@rend='ac']">
        <p class="ac"><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend='ac']">
        <span class="ac"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="tei:q[@rend='ac']">
        <span class="ac"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="tei:pb">
        <hr><xsl:apply-templates/></hr>
    </xsl:template>
    
    <xsl:template match="tei:head">
        <h1><xsl:apply-templates/></h1>
    </xsl:template>
    
    <xsl:template match="tei:back">
        <div class="back"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='endnotes']">
        <div class="endnotes"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="tei:note">
        <div class="note"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='bibliography']">
        <div class="bibliography"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="tei:bibl">
        <div class="bibl"><xsl:apply-templates/></div>
    </xsl:template>
    
</xsl:stylesheet>