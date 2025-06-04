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
                    body{
                    font-family: 'Georgia', serif;
                    background-color: #fdfcf9;
                    color: #333;
                    line-height: 1.6;
                    margin: 0;
                    padding: 2em;
                    }
                    
                    .text {
                    max-width: 750px;
                    margin: auto;
                    background-color: #ffffff;
                    padding: 2em;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
                    border-radius: 8px;
                    }
                    
                    h1, h2 {
                    font-family: 'Palatino Linotype', 'Book Antiqua', Palatino, serif;
                    color: #6b4d2f;
                    border-bottom: 2px solid #ddd;
                    padding-bottom: 0.2em;
                    margin-top: 2em;
                    }
                    
                    h3 {
                    font-size: 1.3em;
                    color: #4b3832;
                    margin-top: 1.5em;
                    }
                    
                    .editorial_intro {
                    margin-bottom: 2em;
                    padding: 1em 1.5em;
                    background-color: #fff9f0;
                    border-left: 5px solid #d4af7f;
                    font-style: italic;
                    border-radius: 4px;
                    }
                    
                    .chapter {
                    margin-top: 2em;
                    }
                    
                    .recipe {
                    background-color: #f9f9f9;
                    border: 1px solid #e0e0e0;
                    border-radius: 6px;
                    padding: 1em 1.5em;
                    margin-bottom: 1.5em;
                    }
                    
                    ul.list {
                    padding-left: 1.2em;
                    }
                    
                    li.item {
                    margin: 0.25em 0;
                    }
                    
                    .author {
                    text-align: right;
                    font-style: italic;
                    color: #666;
                    margin-top: 0.5em;
                    }
                    
                    .endnotes {
                    margin-top: 3em;
                    border-top: 1px solid #ccc;
                    padding-top: 2em;
                    }
                    
                    .endnotes h2 {
                    color: #444;
                    }
                    
                    .note {
                    margin-bottom: 1em;
                    }
                    
                    img {
                    display: block;
                    margin: 1em auto;
                    max-width: 80px;
                    }
                    
                    .header {
                    text-align: center;
                    margin-bottom: 2em;
                    }
                    
                    .header h1 {
                    font-size: 2em;
                    margin: 0;
                    color: #6b4d2f;
                    font-family: 'Palatino Linotype', 'Book Antiqua', Palatino, serif;
                    }
                    
                    .header h2 {
                    font-size: 1em;
                    font-weight: normal;
                    color: #555;
                    margin-top: 0.3em;
                    }
                    
                    .toc {
                    position: fixed;
                    top: 140px;
                    right: 20px;
                    width: 140px;
                    font-size: 0.8em;
                    background-color: #fffef9;
                    border: 1px solid #d9c9aa;
                    padding: 0.7em;
                    border-radius: 6px;
                    box-shadow: 0 0 3px rgba(0, 0, 0, 0.1);
                    z-index: 1000;
                    opacity: 0.9;
                    }
                    
                    .toc h3 {
                    font-size: 0.9em;
                    margin: 0 0 0.5em 0;
                    color: #6b4d2f;
                    text-align: center;
                    }
                    
                    .toc ul {
                    list-style: none;
                    padding-left: 0;
                    margin: 0;
                    }
                    
                    .toc li {
                    margin-bottom: 0.3em;
                    line-height: 1.2;
                    }
                    
                    .toc a {
                    text-decoration: none;
                    color: #4b3832;
                    display: block;
                    }
                    
                    .toc a:hover {
                    text-decoration: underline;
                    }
                    
                    
                    

                </style>
                
            </head>
            
            <body>
                <div class="text">
                    <div class="header">
                        <h1>Kollege Kookery Kinks</h1>
                        <h2>Edited by Demi, Stephanie, Xinyue</h2>
                    </div>
                    
                    <div class="toc">
                        <h3>Table of Contents</h3>
                        <ul>
                            <li><a href="#desserts">Dainty Desserts</a></li>
                            <li><a href="#cakes">Cakes</a></li>
                            <li><a href="#notes">Notes</a></li>
                        </ul>
                    </div>
                    <xsl:apply-templates select="tei:text"/>
                    <xsl:apply-templates select="//tei:note" mode="notes"/>
                </div>
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
        <xsl:variable name="head-text" select="normalize-space(tei:head)"/>
        <div class="chapter">
            <xsl:attribute name="id">
                <xsl:choose>
                    <xsl:when test="contains($head-text, 'Dainty Desserts')">desserts</xsl:when>
                    <xsl:when test="contains($head-text, 'Cakes')">cakes</xsl:when>
                    <xsl:otherwise>chapter</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:apply-templates/>
        </div>
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
        <div class="endnotes" id="notes">
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