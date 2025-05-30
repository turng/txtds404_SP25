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
                <style>
                    .chap {
                    text-transform: uppercase;
                    font-family: "Garamond", "Times New Roman", serif;
                    font-size: 20pt;
                    text-align: center;
                    margin: auto;
                    word-spacing: 12.5px;
                    }
                    
                    .line2 {
                    width: 10%;
                    border: none;
                    border-top: 1.25px solid #000000;
                    margin-top: 31.25px;
                    margin-bottom: 31.25px;
                    }
                    
                    .rectitle {
                    font-variant: small-caps;
                    font-family: "Garamond", "Times New Roman", serif;
                    font-size: 15pt;
                    text-align: center;
                    margin: auto;
                    word-spacing: 8.75px;
                    margin-bottom: 6.25px;
                    }
                    
                    .innerrecint {
                    font-family: "Garamond", "Times New Roman", serif;
                    font-size: 12pt;
                    width: 512.25px;
                    text-align: left;
                    margin: auto;
                    text-indent: 31.25px;
                    margin-bottom: 7px;
                    }
                    
                    
                    .recint {
                    text-align: center;
                    }
                    
                    
                </style>
            </head>
            <body>
                <xsl:apply-templates select="//tei:body"/>
            </body>
        </html>
    </xsl:template>  
    
    <xsl:template match="tei:div[@type='chaptertitle']">
        <div class="chapblock">
            <h1 class="chap"><xsl:apply-templates/></h1>
            <hr class = "line2"/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='recipe']">
        <div class="recint">
            <xsl:apply-templates select="tei:head[@type='rcp']"/> <!-- render the head -->
            <p class="innerrecint">
                <xsl:apply-templates select="tei:p"/>               <!-- render paragraphs -->
            </p>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:head[@type='rcp']">
        <h4 class="rectitle"><xsl:apply-templates/></h4>
    </xsl:template>
    
    <xsl:template match="tei:figDesc"/>
    
    <xsl:template match="tei:sic"/>
    
    <xsl:template match="tei:graphic">
        <img width="512" src="{@url}" />
    </xsl:template>
</xsl:stylesheet> 