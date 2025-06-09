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
                    
                    body {
                    font-family: 'Times New Roman', serif;
                    text-align: center;
                    margin-left: auto;
                    margin-right: auto;
                    margin-top: 75px;
                    margin-bottom: 100px;
                    margin-left:25px;
                    margin-right:25px;
                    }
                    
                    table {
                     text-align: justify;
                     margin-left: auto;
                     margin-right: auto;
                     margin-top: 25px;
                     margin-bottom: 25px;
                     width:400px;
                    }
                    
                    s{
                    text-decoration:none;
                    }
                    
                    .contentblock{
                    padding:1%;
                    }
                    
                    .spacing {
                    margin-top: 8em;
                    }
                    
                    .smallspacing {
                    margin-top: 2em;
                    }
                    
                    .smalltext {
                    font-size: 0.9em;
                    }
                    
                    .smallertext {
                    font-size: 0.8em;
                    }
                    
                    .boldtext {
                    font-weight: bold;
                    font-size: 1.1em;
                    }
                    
                    .booktext {
                    max-width: 500px;
                    text-align: justify;
                    margin-left: auto;
                    margin-right: auto;
                    text-indent: 1em;
                    }
                    
                    .biblcolumns{
                    text-align:center;
                    column-count:2;
                    column-width:10em;
                    }
                    
                    .columns{
                    text-align:justify;
                    text-indent:1em;
                    column-count:2;
                    column-width:20em;
                    column-rule:1px solid;
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
        <p>Original text by: <xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:titleStmt/tei:editor"/>
    <xsl:template match="tei:respStmt">
        <p><xsl:apply-templates select="//tei:resp"/>: <xsl:apply-templates select="//tei:name[@ref='#AC']"/>, 
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
            <div class="biblcolumns">
                <div><xsl:apply-templates select="tei:bibl[1]"/></div>
                <div><xsl:apply-templates select="tei:bibl[2]"/></div>
            </div>
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
        <h4>
            <xsl:if test="@style">
                <xsl:attribute name="style">
                    <xsl:value-of select="@style"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </h4>
    </xsl:template>
    <xsl:template match="tei:body/tei:div">
        <hr style="margin-top:75px;margin-bottom:75px;"/>
        <div class="contentblock">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="tei:div//tei:p">
        <p>
            <xsl:if test="@style">
                <xsl:attribute name="style">
                    <xsl:value-of select="@style"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:div">
        <div>
            <xsl:if test="@rend">
                <xsl:attribute name="class"><xsl:value-of select="@rend"/></xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="tei:q">
        "<xsl:apply-templates/>"
    </xsl:template>
    <xsl:template match="tei:ab">
        <p>
            <xsl:if test="@style">
                <xsl:attribute name="style">
                    <xsl:value-of select="@style"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:hi">
        <s>
            <xsl:if test="@style">
                <xsl:attribute name="style">
                    <xsl:value-of select="@style"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </s>
    </xsl:template>
    <xsl:template match="tei:table">
        <table>
            <xsl:if test="@style">
                <xsl:attribute name="style">
                    <xsl:value-of select="@style"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </table>
    </xsl:template>
    <xsl:template match="tei:row">
        <tr><xsl:apply-templates/></tr>
    </xsl:template>
    <xsl:template match="tei:cell">
        <td>
            <xsl:if test="@style">
                <xsl:attribute name="style">
                    <xsl:value-of select="@style"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@cols">
                <xsl:attribute name="colspan">
                    <xsl:value-of select="@cols"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    <xsl:template match="tei:div[@type='rule']">
        <hr style="width:1000px;"/>
    </xsl:template>
    <xsl:template match="tei:div[@type='shortrule']">
        <hr style="width:200px;"/>
    </xsl:template>
    <xsl:template match="tei:div[@type='shorterrule']">
        <hr style="width:120px;"/>
    </xsl:template>
</xsl:stylesheet>
