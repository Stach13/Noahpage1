<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes"/>
<!-- **************************************************************************-->
<!-- 2022-11-17 ebb: This XSLT starter file is for the XSLT test in DIGIT 110. 
    Do not alter the stylesheet root element or the output line. 
    
   Your task is to transform the source XML document of Bram Stoker's novel Dracula into HTML with a 
   table of contents linked to a reading view, and styled with CSS. Your XSLT code needs to 
   * process one source XML file and output one valid and well-formed HTML file;
   * contain an HTML table  for the table of contents featuring:
        * each chapter heading
        * each chapter's distinct sorted locations
        * each chapter's distinct sorted technologies;
        
   * contain internal links from the chapter headings in the table of contents to the chapter headings;
   * contain span elements in the reading view to stylize the locations and technologies mentioned. 
   * Prepare CSS to style your HTML. The XSLT should output the CSS link line to your CSS file accurately. 
   
   
    -->  
    <!-- **************************************************************************-->
  
 <xsl:template match="/">
     <html>
         <head>
             <title>Dracula</title>
             <link rel="stylesheet" type="text/css" href="style.css"/>
         </head>
         <body>
           <h1 id="top">D R A C U L A</h1>
             
             <!-- Table of contents. -->
             <section id="contents"> 
                 <table> 
                 <tr>
                     <th>Chapter Number</th>
                     <th>Locations mentioned</th>
                     <th>Tech mentioned</th>
                 </tr>
                     
                     <xsl:apply-templates select="descendant::chapter" mode="toc"/>          
             
                 </table>
             </section>
             
             <!--Reading view of the chapters here. -->
             <section id="readingView">
                 <heading>
                 <p>
                         <xsl:apply-templates select="descendant::chapter"/>
                 </p>
                 </heading>

                <!-- ebb: process the same descendant chapter heading elements here, but this time to start processing the reading view.  -->
             </section>
        </body>
        
     </html>
 </xsl:template>
 
 <xsl:template match="descendant::chapter" mode="toc">
    <tr>
        <td>
            <a href="#xml:id"/>
                <xsl:apply-templates select="heading"/>
        </td>
        <td>
            <xsl:value-of select="descendant::location ! normalize-space() =>
                distinct-values() => sort() => string-join(',')"/>
                 
        </td>
        <td>
            <xsl:value-of select="descendant::tech ! normalize-space() =>
                distinct-values() => sort() => string-join(',')"/>
        </td>
    </tr>
 </xsl:template>
    
 <xsl:template match="heading">
     <a href=""
 </xsl:template>
    
 <xsl:template match="p | chapter">
     <p>
         <xsl:apply-templates/>
     </p>
 </xsl:template>
</xsl:stylesheet>