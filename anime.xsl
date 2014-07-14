<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h2>Anime list</h2>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>anidb.net id</th>
        <th>thetvdb.com id</th>
        <th>anime name</th>
        <th>season</th>
        <th>thetvdb.com search</th>
      </tr>
      <xsl:for-each select="anime-list/anime">
      <xsl:sort select="name"/>
      <tr>
        <td><a href="http://anidb.net/a{@anidbid}"><xsl:value-of select="@anidbid"/></a></td>
        <xsl:choose>
          <xsl:when test="@tvdbid != 'unknown'">
            <td><a href="http://thetvdb.com/?tab=series&amp;id={@tvdbid}&amp;lid=7"><xsl:value-of select="@tvdbid"/></a></td>
          </xsl:when>
          <xsl:otherwise>
            <td><xsl:value-of select="@tvdbid"/></td>
          </xsl:otherwise>
        </xsl:choose>        
        <td><xsl:value-of select="name"/></td>
        <td><xsl:value-of select="@defaulttvdbseason"/></td>
        <td><a href="http://thetvdb.com/?string={translate(name,' ','+')}&amp;tab=listseries&amp;function=Search">Search</a></td>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>

