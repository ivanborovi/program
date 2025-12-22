<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">

  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <fo:root>
      <fo:layout-master-set>
        <fo:simple-page-master master-name="A4">
          <fo:region-body margin="2cm"/>
        </fo:simple-page-master>
      </fo:layout-master-set>

      <fo:page-sequence master-reference="A4">
        <fo:flow flow-name="xsl-region-body">

          <fo:block font-size="18pt" font-weight="bold" space-after="10pt">
            Poročilo – neuspešni in odlični študenti
          </fo:block>

          <fo:block font-size="14pt" font-weight="bold" space-before="8pt" space-after="6pt">
            Neuspešni (povprečje &lt; 7)
          </fo:block>

          <fo:table table-layout="fixed" width="100%" border="1pt solid black">
            <fo:table-column column-width="4cm"/>
            <fo:table-column column-width="4cm"/>
            <fo:table-column column-width="3cm"/>
            
            <fo:table-header>
              <fo:table-row>
                <fo:table-cell border="1pt solid black" padding="2pt">
                  <fo:block font-weight="bold">Ime</fo:block>
                </fo:table-cell>
                <fo:table-cell border="1pt solid black" padding="2pt">
                  <fo:block font-weight="bold">Priimek</fo:block>
                </fo:table-cell>
                <fo:table-cell border="1pt solid black" padding="2pt">
                  <fo:block font-weight="bold">Povprečje</fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-header>
            
            <fo:table-body>
              <xsl:for-each select="//student[povprecje &lt; 7]">
                <fo:table-row>
                  <fo:table-cell border="1pt solid black" padding="2pt">
                    <fo:block>
                      <xsl:value-of select="ime"/>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="1pt solid black" padding="2pt">
                    <fo:block>
                      <xsl:value-of select="priimek"/>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="1pt solid black" padding="2pt">
                    <fo:block>
                      <xsl:value-of select="povprecje"/>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:for-each>
            </fo:table-body>
          </fo:table>
          
          <fo:block font-size="14pt" font-weight="bold" space-before="8pt" space-after="6pt">
            Odlični (povprečje ≥ 9)
          </fo:block>

          <fo:list-block>
            <xsl:for-each select="//student[povprecje &gt;= 9]">
              <fo:list-item>
                <fo:list-item-label end-indent="label-end()">
                  <fo:block>•</fo:block>
                </fo:list-item-label>
                <fo:list-item-body start-indent="body-start()">
                  <fo:block>
                    <xsl:value-of select="ime"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="priimek"/>
                    <xsl:text> (povprečje: </xsl:text>
                    <xsl:value-of select="povprecje"/>
                    <xsl:text>)</xsl:text>
                  </fo:block>
                </fo:list-item-body>
              </fo:list-item>
            </xsl:for-each>
          </fo:list-block>

        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
</xsl:stylesheet>
