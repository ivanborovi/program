<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" indent="yes" />

	<xsl:variable name="maxOcena">
		<xsl:for-each select="//predmet/ocena">
			<xsl:sort select="." data-type="number" order="descending"/>
			<xsl:if test="position() = 1">
				<xsl:value-of select="."/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<xsl:variable name="minOcena">
		<xsl:for-each select="//predmet/ocena">
			<xsl:sort select="." data-type="number" order="ascending"/>
			<xsl:if test="position() = 1">
				<xsl:value-of select="."/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>

	<xsl:template match="/">
		<html>
			<head>
				<title>Seznam predmetov</title>
				<style>
					table { border-collapse: collapse; }
					th, td { border: 1px solid #333; padding: 4px; }
					.min { font-weight: bold; text-decoration: underline; }
					.max { font-weight: bold; }
				</style>
			</head>
			<body>
				<h2>Seznam predmetov in ocen</h2>
				<table border="1" cellpadding="4" cellspacing="0">
					<tr>
						<th>Študent</th>
						<th>Koda</th>
						<th>Naziv</th>
						<th>Ocena</th>
					</tr>

					<xsl:for-each select="//student">
						<xsl:variable name="studentIme" select="ime"/>
						<xsl:variable name="studentPriimek" select="priimek"/>

						<xsl:for-each select="predmeti/predmet">
							<tr>
								<td>
									<xsl:value-of select="$studentIme"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="$studentPriimek"/>
								</td>
								<td>
									<xsl:value-of select="@koda"/>
								</td>
								<td>
									<xsl:value-of select="naziv"/>
								</td>
								<td>
									<xsl:choose>
										<xsl:when test="ocena = $maxOcena">
											<span class="max">
												<xsl:value-of select="ocena"/>
											</span>
										</xsl:when>
										<xsl:when test="ocena = $minOcena">
											<span class="min">
												<xsl:value-of select="ocena"/>
											</span>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="ocena"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</xsl:for-each>
					</xsl:for-each>

				</table>

				<p>
					<strong>Legenda:</strong>
					<span class="max">max</span>,
					<span class="min">min</span>
				</p>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>
