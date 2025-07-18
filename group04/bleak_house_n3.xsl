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
    
    <xsl:template match="tei:p[@rend='italics']">
        <p class="italics"><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:p[@rend='subtitle']">
        <h3><xsl:apply-templates/></h3>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend='ac']">
        <span class="ac"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend='italics']">
        <span class="italics"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="tei:q">
        <span class="quote"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="tei:q[@rend='ac']">
        <span class="quote ac"><xsl:apply-templates/></span>
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
        <div class="note">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='bibliography']">
        <div class="bibliography"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="tei:bibl">
        <div class="bibl">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:ref">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@target"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
    <xsl:template match="tei:ptr">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@target"/>
            </xsl:attribute>
            <xsl:value-of select="@target"/>
        </a>
    </xsl:template>
    
    <xsl:template match="tei:graphic">
        <img>
            <xsl:attribute name="src">
                <xsl:value-of select="@url"/>
            </xsl:attribute>
        </img>
    </xsl:template>
    
    <!-- Match the TEI table -->
    <xsl:template match="tei:table">
        <table border="1">
            <xsl:apply-templates/>
        </table>
    </xsl:template>
    
    <!-- Match each row -->
    <xsl:template match="tei:row">
        <tr>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    
    <!-- Match each cell -->
    <xsl:template match="tei:cell">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    
    
</xsl:stylesheet>