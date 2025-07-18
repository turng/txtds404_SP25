<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:eg="http://www.tei-c.org/ns/Examples" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:exsl="http://exslt.org/common"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    extension-element-prefixes="exsl msxsl" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:html="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xsl tei xd eg fn #default">

    <!-- import teibp.xsl, which allows templates, 
         variables, and parameters from teibp.xsl 
         to be overridden here. -->
    <xsl:import href="teibp.xsl"/>
    

<!--
    <xsl:template match="div[@rend='serif']">
        <div class="serif">
            <xsl:apply-templates/>
        </div>
    </xsl:template> -->
    


    <!-- visual quotes around dialogue -->
    <xsl:template match="tei:said">
        <q>
            <xsl:apply-templates/>
        </q>
    </xsl:template>

    <xsl:template match="tei:note[@place = 'foot']">
        <!-- don't do anything for footer -->
    </xsl:template>

    <xsl:template match="tei:title">
        <h1>
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
    
    <xsl:template match="tei:author">
       <!-- don't display dickens -->
    </xsl:template>
    
    <xsl:template match="tei:editor">
        <h3><xsl:apply-templates/></h3>
    </xsl:template>
    
    <xsl:template match="tei:titlePage">
        <xsl:apply-templates/>
    </xsl:template>
    

    <xsl:template match="tei:body">
        <!-- add a little nav bar for fun, it also has styling -->
        <nav class="topnav">
            <ul>
                <li><a href="#">Introduction</a></li>
                <li><a href="#ads-content">Advertisements</a></li>
                <li class="has-subnav">
                    <a href="#ch54">Novel</a>
                    <ul class="subnav">
                        <li><a href="#persons">Characters</a></li>
                        <li><a href="#places">Places</a></li>
                        <li><a href="#legal">Legal terminology</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        

        <div class="content-section">
            <!-- we overrode body, so we recopy the teibp logic for displaying the rest of the file -->
            <xsl:copy>
                <xsl:call-template name="templHtmlAttrLang">
                    <xsl:with-param name="pInput" select="."/>
                </xsl:call-template>
                <xsl:apply-templates select="@* | node()"/>
            </xsl:copy>
        </div>
    </xsl:template>

    <!-- the default standoff formatting is horrendous. let's fix it -->

    <xsl:template match="tei:listPerson">
        <section id="persons">
            <h2>Persons index</h2>
            <xsl:for-each select="tei:person">
                <div class="person">
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <h3>
                        <xsl:value-of select="tei:persName"/>
                    </h3>
                    <xsl:if test="tei:note">
                        <p>
                            <xsl:value-of select="tei:note"/>
                        </p>
                    </xsl:if>
                </div>
            </xsl:for-each>
        </section>
    </xsl:template>

    <xsl:template match="tei:listPlace">
        <section id="places">
            <h2>Places index</h2>
            <xsl:for-each select="tei:place">
                <div class="place">
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <h3>
                        <xsl:value-of select="tei:placeName"/>
                    </h3>
                    <xsl:if test="tei:note">
                        <p>
                            <xsl:value-of select="tei:note"/>
                        </p>
                    </xsl:if>
                </div>
            </xsl:for-each>
        </section>
    </xsl:template>

    <xsl:template match="tei:list[@xml:id = 'legal']">
        <section id="legal">
            <h2>Legal terminology</h2>
            <xsl:for-each select="tei:item">
                <div class="place">
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <h3>
                        <xsl:value-of select="tei:term"/>
                    </h3>
                    <xsl:if test="tei:note">
                        <p>
                            <xsl:value-of select="tei:note"/>
                        </p>
                    </xsl:if>
                </div>
            </xsl:for-each>
        </section>
    </xsl:template>
    
    <xsl:template match="tei:bibl">
        <p><xsl:apply-templates select="descendant::text()"/></p>
    </xsl:template>
    
    <!-- fix notes formatting? -->
    <xsl:key name="notesById" match="tei:note" use="@xml:id"/>
    
    <xsl:template match="tei:ref">
        <xsl:variable name="noteId" select="substring-after(@target, '#')" />
        <span class="note-ref">
            <xsl:apply-templates/>
            <span class="note-popup">
                <xsl:apply-templates select="key('notesById', $noteId)/* | key('notesById', $noteId)/text()" />
            </span>
        </span>
    </xsl:template>
    
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template> 
    
    <xsl:template match="tei:figure[tei:graphic[@url]]" priority="99">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:call-template name="addID"/>
            <figure>
                <img alt="{normalize-space(tei:figDesc)}" src="{tei:graphic/@url}"/>
                <xsl:apply-templates select="*[ not( self::tei:graphic | self::tei:figDesc ) ]"/>
            </figure>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
