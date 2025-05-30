<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs math" version="1.0">
    
    <xsl:output method="html"/>
    
    <xsl:template match="/tei:TEI">
        <html>
            <head>
                <title>
                    <xsl:value-of select="tei:title"/>
                </title>
                <style>
               
            body {
                font-family: 'Times New Roman', serif;
                text-align: center;
                margin-top: 75px;
                margin-bottom: 100px;
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
            hr {
                width: 150px;
            }

                </style>
            </head>
            <body>
                <xsl:apply-templates select="tei:text/tei:body"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:body">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:div">
        <div>
            <xsl:if test="@rend">
                <xsl:attribute name="class"><xsl:value-of select="@rend"/></xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:head">
        <h1><xsl:value-of select="."/></h1>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='rule']">
        <hr/>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
   
    <xsl:template match="tei:seg[@source = 'boldtext']">
        <span class="boldtext">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
    
</xsl:stylesheet>
