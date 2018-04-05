<?xml version="1.0"?>
<xsl:stylesheet
   version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:xsd="http://www.w3.org/2001/XMLSchema"
   xmlns:msxsl="urn:schemas-microsoft-com:xslt">
  
  <xsl:strip-space elements="*"/>
  <xsl:output method="xml"
      omit-xml-declaration="yes"
      indent="yes"
       />

  <xsl:template match="/">
    <xsl:for-each select="glosario">
      <xsl:element name="glosario">
        <xsl:for-each select="letra">
          <xsl:element name="letra">
            <xsl:attribute name="id">
              <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:for-each select="definicao">
              <xsl:element name="definicao">
                <xsl:attribute name="Título">
                  <xsl:value-of select="titulo"/>
                </xsl:attribute>
                <xsl:attribute name="Descrição">
                  <xsl:value-of select="conteudo"/>
                </xsl:attribute>
              </xsl:element>
            </xsl:for-each>
          </xsl:element>
        </xsl:for-each>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
