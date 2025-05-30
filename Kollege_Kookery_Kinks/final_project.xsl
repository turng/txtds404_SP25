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
                <title>Kollege Kookery Kinks</title>
                <style>
                    .text{
                        font-size: 14pt;
                        width: 600px;
                        margin: auto;
                    }
                    
                    .editorial_intro {
                        margin-bottom: 2em;
                        font-style: italic;
                        padding: 1em;
                        background-color: #f9f9f9;
                        border-left: 4px solid #ccc;
                    }
                    
                    .author {
                        text-align: right;
                    }
                    
                </style>
            </head>
            <body>
                <div class="text"><xsl:apply-templates select="tei:text"/>
                    <xsl:apply-templates select="//tei:note" mode="notes"/></div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:text/tei:body">
        
        <xsl:apply-templates/>
        
    </xsl:template>
    
    <xsl:template match="tei:div[@type='editorial_intro']">
        <div class="editorial_intro">
            <h2>Editorial Introduction</h2>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    
    <xsl:template match="tei:head[@type='section']">
        <h1><xsl:apply-templates/></h1>
    </xsl:template>
    
    <xsl:template match="tei:quote">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:graphic">
        <img width="10%">
            <xsl:attribute name="src">
                <xsl:value-of select="@url"/>
            </xsl:attribute>
        </img>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='chapter']/tei:head">
        <h2><xsl:apply-templates/></h2>
    </xsl:template>
    
    <xsl:template match="tei:head">
        <h3><xsl:apply-templates/></h3>
    </xsl:template>
    
    <xsl:template match="tei:byline">
        <p class="author"><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='chapter']">
        <div class="chapter"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='recipe']">
        <div class="recipe"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="tei:list">
        <ul class="list"><xsl:apply-templates/></ul>
    </xsl:template>
    
    <xsl:template match="tei:item">
        <li class="item"><xsl:apply-templates/></li>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='endnotes']">
        <div class="endnotes">
            <h2>Notes</h2>
            <ol>
                <xsl:apply-templates select="//tei:note"/>
            </ol>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:note">
        <li class="note" style="margin-bottom:1em;">
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='bibliography']">
        <div class="bibliography">
            <h2>Bibliography</h2>
            <ul>
                <xsl:apply-templates select="//tei:bibl"/>
            </ul>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:bibl">
        <li class="bibl">
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    
    <xsl:template match="tei:author">
        <strong><xsl:apply-templates/></strong>
    </xsl:template>
    
    <xsl:template match="tei:title">
        <em><xsl:apply-templates/></em>
    </xsl:template>
    
    <xsl:template match="tei:date">
        (<xsl:apply-templates/>) 
    </xsl:template>
    
    <xsl:template match="tei:publisher">
        <span><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="tei:ptr">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@target"/>
            </xsl:attribute>
            [Link]
        </a>
    </xsl:template>
    
    
    
    
    
    
    
    
</xsl:stylesheet>