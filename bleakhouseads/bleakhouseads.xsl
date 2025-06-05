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
                <title><xsl:apply-templates select="//tei:titleStmt/tei:title"/></title>
                <style>
                    .contentblock{
                    padding:1%;
                    }
                </style>
            </head>
            <body>
                <div>
                    <xsl:apply-templates select="//tei:fileDesc"/>
                </div>
                <div>
                    <xsl:apply-templates select="//tei:body"/>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="tei:titleStmt/tei:title">
        <h1><xsl:apply-templates/></h1>
    </xsl:template>
    <xsl:template match="tei:titleStmt/tei:author">
        <h2><xsl:apply-templates/></h2>
    </xsl:template>
    <xsl:template match="tei:titleStmt/tei:editor"/>
    <xsl:template match="tei:respStmt">
        <p><xsl:apply-templates select="//tei:resp"/> 
           <xsl:apply-templates select="//tei:name[@ref='#AC']"/>, 
           <xsl:apply-templates select="//tei:name[@ref='#JN']"/>, and
           <xsl:apply-templates select="//tei:name[@ref='#LVH']"/>.
        </p>
    </xsl:template>
    <xsl:template match="tei:editionStmt">
        <p>Edition of the project: <xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:publicationStmt/tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:sourceDesc">
        <div>
            Print editions used in the creation of this digital edition:
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="tei:sourceDesc//tei:title">
        <h4><xsl:apply-templates/></h4>
    </xsl:template>
    <xsl:template match="tei:sourceDesc//tei:author">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:sourceDesc//tei:publisher">
        <p><xsl:apply-templates select="tei:name"/><br/>
        <xsl:apply-templates select="tei:address/tei:addrLine"/><br/>
        <xsl:apply-templates select="tei:address/tei:settlement"/>, <xsl:apply-templates select="tei:address/tei:country"/></p>
    </xsl:template>
    <xsl:template match="tei:sourceDesc//tei:note">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:text">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="tei:head">
        <h4><xsl:apply-templates/></h4>
    </xsl:template>
    <xsl:template match="tei:body/tei:div">
        <hr></hr>
        <div class="contentblock">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="tei:div//tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:quote">
        "<xsl:apply-templates/>"
    </xsl:template>
    <xsl:template match="tei:ab">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:hi[@rend='allcaps']">
        <hi style="text-transform:uppercase;"><xsl:apply-templates/></hi>
    </xsl:template>
    <xsl:template match="tei:table">
        <table><xsl:apply-templates/></table>
    </xsl:template>
    <xsl:template match="tei:row">
        <tr><xsl:apply-templates/></tr>
    </xsl:template>
    <xsl:template match="tei:cell">
        <td><xsl:apply-templates/></td>
    </xsl:template>
    <xsl:template match="tei:div[@type='rule']">
        <hr/>
    </xsl:template>
</xsl:stylesheet>
