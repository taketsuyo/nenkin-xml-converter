<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<html>
		<head>
			<META http-equiv="X-UA-Compatible" content="IE=11" />
			<title>船員保険・厚生年金保険標準賞与額決定一覧表</title>
			<style type="text/css">
			<!--テーブル属性-->
				table.outline							<!--外枠-->
				{
					border			:1px solid #000000;
					width			:940px;
					height			:634px;
				}
				table.detail							<!--通知書領域テーブル-->
				{
					border-collapse		:collapse;
					width				:900px;
					table-layout		:fixed;
				}
				table.dispArea
				{
					border-collapse		:collapse;
					width				:900px;
					height				:310px;
					table-layout		:fixed;
				}
				td.outline							<!--セル定義(外枠)-->
				{
					text-align			:center;
					vertical-align		:top;
				}
				td.allline							<!--セル定義(ライン有)-->
				{
					border-top			:1px solid #000000;
					border-left			:1px solid #000000;
					border-right		:1px solid #000000;
					border-bottom		:1px solid #000000;
				}
				td.linetlr							<!--セル定義(ライン有)-->
				{
					border-top		:1px solid #000000;
					border-left		:1px solid #000000;
					border-right	:1px solid #000000;
				}
				td.lineb							<!--セル定義(ライン有)-->
				{
					border-bottom		:1px solid #000000;
				}
				td.linel							<!--セル定義(ライン有)-->
				{
					border-left		:1px solid #000000;
				}
				td.linelclear							<!--セル定義(ライン無)-->
				{
					border-left		:0px;
				}
				td.linerclear							<!--セル定義(ライン無)-->
				{
					border-right	:0px;
				}
				tr.h_data1							<!--セル高さ定義-->
				{
					height			:20px;
				}
				tr.h_data2							<!--セル高さ定義-->
				{
					height			:30px;
				}
				tr.h_data3							<!--セル高さ定義-->
				{
					height			:15px;
				}
			<!--フォント定義-->
			<!-- Safari -->
				@media screen and (-webkit-min-device-pixel-ratio: 0) {
					_::-webkit-full-page-media, _:future, :root body {
						letter-spacing:-0.4px;
					}
					_::-webkit-full-page-media, _:future, :root pre {
						letter-spacing:0px;
						margin-left:3px;
					}
					_::-webkit-full-page-media, _:future, :root pre.oshirase {
						white-space:break-spaces;
					}
					_::-webkit-full-page-media, _:future, :root div {
						letter-spacing:-0.4px;
					}
				}
				.title								<!--標題-->
				{
					font-family		:YuGothic, Yu Gothic;
					font-size		:14pt;
					font-weight		:bold;
					text-align		:left;
				}
				.midashi							<!--見出し項目-->
				{
					font-family		:YuGothic, Yu Gothic;
					font-size		:10pt;
					text-align		:left;
				}
				.midashict							<!--見出し項目-->
				{
					font-family		:Yu Gothic, serif;
					font-size		:10pt;
					text-align		:center;
				}
				.midashirt							<!--見出し項目-->
				{
					font-family		:YuGothic, Yu Gothic;
					font-size		:10pt;
					text-align		:right;
				}
				.normal								<!--明細データ（文字項目）-->
				{
					font-family		:YuMincho, Yu Mincho;
					font-size		:10pt;
					text-align		:left;
				}
				.normalct							<!--明細データ（文字項目）-->
				{
					font-family		:YuMincho, Yu Mincho;
					font-size		:10pt;
					text-align		:center	;
				}
				.normalrt							<!--明細データ（文字項目）-->
				{
					font-family		:YuMincho, Yu Mincho;
					font-size		:10pt;
					text-align		:right;
				}
				.kyouji
				{
					font-family		:YuMincho, Yu Mincho;
					font-size		:10pt;
					text-align		:left;
				}
				br								<!--改行フォント-->
				{
					font-family		:YuMincho, Yu Mincho;
					font-size		:10pt;
				}
				br.small							<!--改行フォント-->
				{
					font-family		:YuMincho, Yu Mincho;
					font-size		:5pt;
				}
				br.kaipage						<!--改行フォント-->
				{
					font-family		:YuMincho, Yu Mincho;
					font-size		:3px;
				}
			</style>
		</head>
		
		<body style="word-break:break-all;">
			<table border="0" width="100%" style="center" >
				<td  align="center" style="vertical-align:top;">
					<xsl:apply-templates/>
				</td>
			</table>
		</body>
	</html>
</xsl:template>

<xsl:template match="N4002002">
	<!--外枠-->
	<table class="outline" cellpadding="20px">						<!--１頁目-->
		<tr>
			<td class="outline">
				<br/>
				<br/>
				<br/>
				<table class="dispArea">
					<tr>
						<td style="vertical-align:top;">
							<!-- タイトル作成・被保険者証の記号表示 -->
							<table class="detail">
								<colgroup>
									<col width="110px"/>
									<col width="110px"/>
								</colgroup>
								
								<tr class="h_data1">
									<td class="midashict allline">船舶所有者<br/>整理記号</td>
									<td class="midashict allline">告知番号</td>
									<td class="title" rowspan="2">　　船員保険・厚生年金保険標準賞与額決定一覧表</td>
								</tr>
								
								<tr class="h_data1">
									<td class="normalct allline"><xsl:value-of select="船舶所有者整理記号" /></td>
									<td class="normalct allline"><xsl:value-of select="告知番号" /></td>
								</tr>
								
							</table>
							<br/>
							<br/>
							<!--　被保険者単位のデータ表示　-->
							<table class="detail" cellpadding="0" cellspacing="0">
								<colgroup>
									<col width="95px"/>
									<col width="200px"/>
									<col width="125px"/>
									<col width="125px"/>
									<col width="125px"/>
									<col width="110px"/>
									<col width="110px"/>
								</colgroup>

								<tr class="h_data1">
									<td class="midashict allline" rowspan="2">被保険者<br/>整理番号</td>
									<td class="midashict allline" rowspan="2">被保険者氏名</td>
									<td class="midashict allline" rowspan="2">生年月日</td>
									<td class="midashict allline" rowspan="2">種別</td>
									<td class="midashict allline" rowspan="2">賞与支払年月日</td>
									<td class="midashict allline" colspan="2">決定後の標準賞与額</td>
								</tr>
								
								<tr class="h_data1">
									<td class="midashict allline">（船保）</td>
									<td class="midashict allline">（厚年）</td>
								</tr>

								<!--　個別表示スタイル呼出　-->
								<xsl:apply-templates select="_被保険者" />
							</table>
						</td>
					</tr>
				</table>
				<br/>
				<!--　事業所情報表示　-->
				<table class="detail" cellpadding="0" cellspacing="0">
					<colgroup>
						<col width="125px"/>
						<col width="275px"/>
						<col width="25px"/>
						<col width="25px"/>
					</colgroup>

					<tr>
						<td class="linetlr"><br class="small"/></td>
						<td class="linetlr" colspan="2"><br class="small"/></td>
						<td><br class="small"/></td>
						<td><br class="small"/></td>
					</tr>

					<tr class="h_data3">
						<td class="midashi linel">郵便番号</td>
						<xsl:if test="郵便番号x宛先x親番号='' and 郵便番号x宛先x子番号='' ">
							<td class="linel" colspan="2"><br/></td>
						</xsl:if>
						<xsl:if test="郵便番号x宛先x親番号!='' or 郵便番号x宛先x子番号!='' ">
							<td class="normal linel" valign="top" colspan="2"><xsl:value-of select="郵便番号x宛先x親番号" />-<xsl:value-of select="郵便番号x宛先x子番号" /></td>
						</xsl:if>
						<td class="linel"><br/></td>
						<td><br/></td>
					</tr>

					<tr>
						<td class="linel"><br class="small"/></td>
						<td class="linel"><br class="small"/></td>
						<td><br class="small"/></td>
						<td class="linel"><br class="small"/></td>
						<td><br class="small"/></td>
					</tr>

					<tr class="h_data2">
						<td class="midashi linel" valign="top">船舶所有者住所</td>
						<td class="normal  linel" valign="top" colspan="2"><xsl:value-of select="船舶所有者住所x宛先" /></td>
						<td class="linel"><br/></td>
						<td class="normal"></td>
					</tr>

					<tr>
						<td class="linel"><br class="small"/></td>
						<td class="linel"><br class="small"/></td>
						<td><br class="small"/></td>
						<td class="linel"><br class="small"/></td>
						<td><br class="small"/></td>
					</tr>

					<tr class="h_data3">
						<td class="midashi linel" rowspan="2" valign="top">船舶所有者氏名</td>
						<td class="normal linel" rowspan="2" valign="top"><xsl:value-of select="船舶所有者氏名x宛先" /></td>
						<td><br/></td>
						<td class="linel"><br/></td>
						<td><br/></td>
					</tr>
					
					<tr class="h_data3">
						<td class="normal">様</td>
						<td class="linel"><br/></td>
						<td class="normalrt"><xsl:value-of select="concat(通知年月日x元号,' ',通知年月日x年,' 年 ',通知年月日x月,' 月 ',通知年月日x日,' 日')" /></td>
					</tr>

					<tr>
						<td class="linel lineb"><br class="small"/></td>
						<td class="linel lineb"><br class="small"/></td>
						<td class="lineb"><br class="small"/></td>
						<td class="linel"><br class="small"/></td>
						<td><br class="small"/></td>
					</tr>
						
				</table>
			</td>
		</tr>
	</table>
</xsl:template>

<!--　各被保険者情報表示スタイル　-->
<xsl:template match="_被保険者">

	<tr class="h_data1">
		<td class="normalct allline"><xsl:value-of select="被保険者整理番号" /></td>
		<td class="normal allline"><xsl:value-of select="被保険者氏名" /></td>
		
		<xsl:if test="生年月日x元号='' and 生年月日x年='' and 生年月日x月='' and 生年月日x日=''">
			<td class="normalct allline"><br/></td>
		</xsl:if>
		<xsl:if test="生年月日x元号!='' or 生年月日x年!='' or 生年月日x月!='' or 生年月日x日!=''">
			<td class="normalct allline"><xsl:value-of select="concat(生年月日x元号,生年月日x年,'.',生年月日x月,'.',生年月日x日)" /></td>
		</xsl:if>
		
		<td class="normalct allline"><xsl:value-of select="種別" /></td>
		<xsl:if test="賞与支払年月日x元号='' and 賞与支払年月日x年='' and 賞与支払年月日x月='' and 賞与支払年月日x日=''">
			<td class="normalct allline"><br/></td>
		</xsl:if>
		<xsl:if test="賞与支払年月日x元号!='' or 賞与支払年月日x年!='' or 賞与支払年月日x月!='' or 賞与支払年月日x日!=''">
			<td class="normalct allline"><xsl:value-of select="concat(賞与支払年月日x元号,賞与支払年月日x年,'.',賞与支払年月日x月,'.',賞与支払年月日x日)" /></td>
		</xsl:if>
		
		<td class="normalrt allline">
			<xsl:call-template name="kingaku_hyoji">
				<xsl:with-param name="getsugaku" select="決定後の標準賞与額x船保"/>
			</xsl:call-template>
		</td>
		
		<td class="normalrt allline">
			<xsl:call-template name="kingaku_hyoji">
				<xsl:with-param name="getsugaku" select="決定後の標準賞与額x厚年"/>
			</xsl:call-template>
		</td>
	</tr>

</xsl:template>


<!--月額項目表示-->
<xsl:template name="kingaku_hyoji">
	<xsl:param name="getsugaku"/>
	<xsl:choose>
		<xsl:when test="$getsugaku=''">*********</xsl:when>
		<xsl:when test="$getsugaku='0'">*********</xsl:when>
		<xsl:when test="$getsugaku=' 0'">*********</xsl:when>
		<xsl:when test="$getsugaku='  0'">*********</xsl:when>
		<xsl:when test="$getsugaku='   0'">*********</xsl:when>
		<xsl:when test="$getsugaku='00'">*********</xsl:when>
		<xsl:when test="$getsugaku=' 00'">*********</xsl:when>
		<xsl:when test="$getsugaku='  00'">*********</xsl:when>
		<xsl:when test="$getsugaku='000'">*********</xsl:when>
		<xsl:when test="$getsugaku=' 000'">*********</xsl:when>
		<xsl:when test="$getsugaku='0000'">*********</xsl:when>
		<xsl:otherwise><xsl:value-of select="concat($getsugaku,' 千円')" /></xsl:otherwise>
	</xsl:choose>
</xsl:template>


<!--CDATA対応-->
<xsl:template match="*">
	<xsl:value-of select="." disable-output-escaping="yes" />
</xsl:template>

</xsl:stylesheet>
