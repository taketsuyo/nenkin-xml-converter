<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<html>
		<head>
			<META http-equiv="X-UA-Compatible" content="IE=11" />
			<title>船員保険厚生年金保険被保険者種別変更確認及び標準報酬改定一覧表</title>
			<style type="text/css">
			<!--テーブル属性-->
				table.outline						<!--外枠-->
				{
					border			:1px solid #000000;
					width			:940px;
					height			:634px;
				}
				table.detail						<!--通知書領域テーブル-->
				{
					border-collapse	:collapse;
					width			:900px;
					table-layout	:fixed;
				}
				table.detail2						<!--通知書領域テーブル-->
				{
					border-collapse	:collapse;
					width			:870px;
					margin-top		:25px;
					table-layout	:fixed;
				}
				table.dispArea
				{
					border-collapse	:collapse;
					width			:900px;
					height			:430px;
					table-layout	:fixed;
				}
				td.outline							<!--セル定義(外枠)-->
				{
					text-align		:center;
					vertical-align	:top;
				}
				td.allline							<!--セル定義(ライン有)-->
				{
					border-top		:1px solid #000000;
					border-left		:1px solid #000000;
					border-right	:1px solid #000000;
					border-bottom	:1px solid #000000;
				}
				td.linetlr							<!--セル定義(ライン有)-->
				{
					border-top		:1px solid #000000;
					border-left		:1px solid #000000;
					border-right	:1px solid #000000;
				}
				td.lineb							<!--セル定義(ライン有)-->
				{
					border-bottom	:1px solid #000000;
				}
				td.linel							<!--セル定義(ライン有)-->
				{
					border-left		:1px solid #000000;
				}
				td.linelclear						<!--セル定義(ライン無)-->
				{
					border-left		:0px;
				}
				td.linerclear						<!--セル定義(ライン無)-->
				{
					border-right	:0px;
				}
				tr.h_data1							<!--セル高さ定義-->
				{
					height			:25px;
				}
				tr.h_data2							<!--セル高さ定義-->
				{
					height			:17px;
				}
				tr.h_data3							<!--セル高さ定義-->
				{
					height			:23px;
				}
				tr.h_data4							<!--セル高さ定義-->
				{
					height			:30px;
				}

			<!--フォント定義-->
				.title								<!--標題-->
				{
					font-family		:"ＭＳ ゴシック";
					font-size		:14pt;
					font-weight		:bold;
					text-align		:center;
				}
				.midashi							<!--見出し項目-->
				{
					font-family		:"ＭＳ ゴシック";
					font-size		:8pt;
					text-align		:left;
				}
				.midashi10							<!--見出し項目-->
				{
					font-family		:"ＭＳ ゴシック";
					font-size		:10pt;
					text-align		:left;
				}
				.midashict							<!--見出し項目-->
				{
					font-family		:"ＭＳ ゴシック";
					font-size		:8pt;
					text-align		:center;
				}
				.midashict7							<!--見出し項目（ＸＰ対応のため追加）-->
				{
					font-family		:"ＭＳ ゴシック";
					font-size		:7pt;
					text-align		:center;
				}
				.normal								<!--明細データ（文字項目）-->
				{
					font-family		:"ＭＳ 明朝";
					font-size		:9pt;
					text-align		:left;
				}
				.normal10							<!--明細データ（文字項目）-->
				{
					font-family		:"ＭＳ 明朝";
					font-size		:10pt;
					text-align		:left;
				}
				.normalct							<!--明細データ（文字項目）-->
				{
					font-family		:"ＭＳ 明朝";
					font-size		:9pt;
					text-align		:center	;
				}
				.normalrt							<!--明細データ（文字項目）-->
				{
					font-family		:"ＭＳ 明朝";
					font-size		:9pt;
					text-align		:right;
				}
				.normal10rt							<!--明細データ（文字項目）-->
				{
					font-family		:"ＭＳ 明朝";
					font-size		:10pt;
					text-align		:right;
				}
				.tuuchi								<!--明細データ（文字項目）-->
				{
					font-family		:"ＭＳ 明朝";
					font-size		:10pt;
					text-align		:left;
				}
				.kyouji								<!--明細データ（教示文書）-->
				{
					font-family		:"ＭＳ 明朝";
					font-size		:10pt;
					text-align		:left;
				}
				br									<!--改行フォント-->
				{
					font-family		:"ＭＳ 明朝";
					font-size		:10pt;
				}
				br.kaigyou							<!--改行フォント-->
				{
					font-family		:"ＭＳ 明朝";
					font-size		:1px;
				}
				br.small							<!--改行フォント-->
				{
					font-family		:"ＭＳ 明朝";
					font-size		:5pt;
				}
				br.kaipage							<!--改行フォント-->
				{
					font-family		:"ＭＳ 明朝";
					font-size		:3px;
				}

			</style>
		</head>
		
		<body style="word-break:break-all;">
			<table border="0" width="100%" style="center" >
				<tr>
					<td align="center" style="vertical-align:top;">
						<xsl:apply-templates />
					</td>
				</tr>
			</table>
		</body>
	</html>
</xsl:template>

<xsl:template match="N4003004">
	<table class="outline" cellpadding="20px">
		<tr>
			<td class="outline">
				<table class="dispArea">
					<tr>
						<td style="vertical-align:top;">
							<!-- タイトル作成 -->
							<table class="detail title">
								<tr>
									<td>船員保険厚生年金保険被保険者種別変更確認及び標準報酬改定一覧表</td>
								</tr>
							</table>
							<br/>
							<br/>
							<!-- 被保険者証の記号表示 -->
							<table class="detail" cellpadding="5" cellspacing="0">
								<colgroup>
									<col width="70px"/>
									<col width="70px"/>
								</colgroup>
								<tr>
									<td class="midashict allline" colspan="2">船舶所有者整理記号</td>
								</tr>
								<tr class="h_data1">
									<td class="normalct linetlr"><xsl:value-of select="船舶所有者整理記号x事業所略称名" /></td>
									<td class="normalct linetlr"><xsl:value-of select="船舶所有者整理記号x記号" /></td>
									<td class="midashict" colspan="2"><br/></td>
								</tr>
							</table>

							<!--　被保険者単位のデータ表示　-->
							<table class="detail" cellpadding="0" cellspacing="0">
								<colgroup>
									<col width="58px"/>
									<col width="31px"/>
									<col width="41px"/>
									<col width="110px"/>
									<col width="59px"/>
									<col width="33px"/>
									<col width="78px"/>
									<col width="33px"/>
									<col width="29px"/>
									<col width="29px"/>
									<col width="29px"/>
									<col width="19px"/>
									<col width="55px"/>
									<col width="15px"/>
									<col width="102px"/>
									<col width="19px"/>
									<col width="55px"/>
								</colgroup>

								<tr class="h_data2">
									<td class="midashict allline" rowspan="3">被保険者<br/>整理番号</td>
									<td class="midashict allline" colspan="2" rowspan="3">基礎年金番号</td>
									<td class="midashict allline" rowspan="3">被保険者の氏名</td>
									<td class="midashict allline" rowspan="3">生年月日</td>
									<td class="midashict7 allline" rowspan="3">変更前<br/>の種別</td>
									<td class="midashict allline" rowspan="3">職務</td>
									<td class="midashict7 allline" rowspan="3">変更後<br/>の種別</td>
									<td class="midashict allline" colspan="3" rowspan="3">変更年月日</td>
									<td class="midashict allline" colspan="2" rowspan="3">(従前の)<br/>標準<br/>報酬月額</td>
									<td class="midashict allline" rowspan="3">報<br/>酬<br/>月<br/>額</td>
									<td class="midashict7 allline">金銭によるものの額</td>
									<td class="midashict allline" colspan="2" rowspan="3">標準<br/>報酬月額</td>
									<td class="midashict allline" rowspan="3">備　　　考<br/>(変更の事由)</td>
								</tr>
								<tr class="h_data2">
									<td class="midashict7 allline">現物によるものの額</td>
								</tr>
								<tr class="h_data2">
									<td class="midashict allline">合　　　計</td>
								</tr>
								<!--　ダミー行の設定　-->
								<tr>
									<td><br class="kaigyou"/></td>
									<td><br class="kaigyou"/></td>
									<td><br class="kaigyou"/></td>
									<td><br class="kaigyou"/></td>
									<td><br class="kaigyou"/></td>
									<td><br class="kaigyou"/></td>
									<td><br class="kaigyou"/></td>
									<td><br class="kaigyou"/></td>
									<td><br class="kaigyou"/></td>
									<td><br class="kaigyou"/></td>
									<td><br class="kaigyou"/></td>
									<td><br class="kaigyou"/></td>
									<td><br class="kaigyou"/></td>
									<td><br class="kaigyou"/></td>
									<td><br class="kaigyou"/></td>
									<td><br class="kaigyou"/></td>
									<td><br class="kaigyou"/></td>
									<td><br class="kaigyou"/></td>
								</tr>

								<!--　個別表示スタイル呼出　-->
								<xsl:apply-templates select="_被保険者" />
							</table>
						</td>
					</tr>
				</table>

				<!--　事業所情報表示　-->
				<table class="detail" cellpadding="0" cellspacing="0">
					<colgroup>
						<col width="105px"/>
						<col width="390px"/>
						<col width="10px"/>
					</colgroup>

					<tr>
						<td class="linetlr"><br class="small"/></td>
						<td class="linetlr"><br class="small"/></td>
						<td><br class="small"/></td>
						<td><br class="small"/></td>
					</tr>

					<tr>
						<td class="midashi10 linel" rowspan="2" valign="top">船舶所有者住所</td>
						<xsl:if test="船舶所有者住所x郵便番号x親番号='' and 船舶所有者住所x郵便番号x子番号='' ">
							<td class="normal10 linel" valign="top">〒<br/></td>
						</xsl:if>
						<xsl:if test="船舶所有者住所x郵便番号x親番号!='' or 船舶所有者住所x郵便番号x子番号!='' ">
							<td class="normal10 linel" valign="top">〒<xsl:value-of select="船舶所有者住所x郵便番号x親番号" />-<xsl:value-of select="船舶所有者住所x郵便番号x子番号" /></td>
						</xsl:if>
						<td class="linel"><br/></td>
						<td class="tuuchi" rowspan="2" valign="top"></td>
					</tr>

					<tr class="h_data4">
						<td class="normal10 linel" valign="top"><xsl:value-of select="船舶所有者住所" /></td>
						<td class="linel"><br/></td>
					</tr>
					<tr>
						<td class="linel"><br class="small"/></td>
						<td class="linel"><br class="small"/></td>
						<td class="linel"><br class="small"/></td>
						<td><br class="small"/></td>
					</tr>

					<tr>
						<td class="midashi10 linel">船舶所有者氏名</td>
						<td class="normal10 linel"><xsl:value-of select="concat(船舶所有者氏名,'　様')" /></td>
						<td class="linel"><br/></td>
						<td class="normal10rt"><xsl:value-of select="concat('令和 ',通知年月日x年,' 年 ',通知年月日x月,' 月 ',通知年月日x日,' 日')" /></td>
					</tr>
					<tr>
						<td class="linel"><br class="small"/></td>
						<td class="linel"><br class="small"/></td>
						<td class="linel"><br class="small"/></td>
						<td><br class="small"/></td>
					</tr>

					<tr>
						<td class="midashi10 linel">電　　　　話</td>
						<td class="normal10 linel">
							<xsl:if test="電話x市外局番!='' or 電話x局番!='' or 電話x番号!=''">
								<xsl:value-of select="concat(電話x市外局番,' ( ',電話x局番,' 局) ',電話x番号,' 番')" />
							</xsl:if>
						</td>
						<td class="linel"><br/></td>
						<td class="normal10rt"></td>
					</tr>

					<tr>
						<td class="linel lineb"><br class="small"/></td>
						<td class="linel lineb"><br class="small"/></td>
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

	<tr>
		<td colspan="17"><br class="small" /></td>
	</tr>
	<tr class="h_data3">
		<td class="normalct allline"><xsl:value-of select="船舶種類" /></td>
		<td class="normalct allline" rowspan="2"><xsl:value-of select="年金手帳の基礎年金番号x課所符号" /></td>
		<td class="normalct allline" rowspan="2"><xsl:value-of select="年金手帳の基礎年金番号x一連番号" /></td>
		<td class="normal allline" rowspan="2"><xsl:value-of select="被保険者の氏名" /></td>
		<xsl:if test="生年月日x元号='' and 生年月日x年='' and 生年月日x月='' and 生年月日x日=''">
			<td class="normalct allline" rowspan="2"><br/></td>
		</xsl:if>
		<xsl:if test="生年月日x元号!='' or 生年月日x年!='' or 生年月日x月!='' or 生年月日x日!=''">
			<td class="normalct allline" rowspan="2"><xsl:value-of select="concat(生年月日x元号,生年月日x年,'.',生年月日x月,'.',生年月日x日)" /></td>
		</xsl:if>
		<td class="normalct allline" rowspan="2"><xsl:value-of select="変更前の種別" /></td>
		<xsl:if test="職務xその他=''">
			<td class="normalct allline" rowspan="2"><xsl:value-of select="職務" /></td>
		</xsl:if>
		<xsl:if test="職務xその他!=''">
			<td class="normalct allline" rowspan="2"><xsl:value-of select="職務" /><br/><xsl:value-of select="concat('(',職務xその他,')')" /></td>
		</xsl:if>
		<td class="normalct allline" rowspan="2"><xsl:value-of select="変更後の種別" /></td>
		
		<td class="normalrt allline linerclear" rowspan="2">
		<xsl:if test="変更年月日x元号!=''">
			<div class="normal"><xsl:value-of select="変更年月日x元号" /></div>
		</xsl:if>
		<xsl:if test="変更年月日x元号=''">
			<br/>
		</xsl:if>
		<xsl:value-of select="concat(変更年月日x年,'年')" />
		</td>
		
		<td class="normalrt allline linelclear linerclear" rowspan="2"><br/><xsl:value-of select="concat(変更年月日x月,'月')" /></td>
		<td class="normalrt allline linelclear" rowspan="2"><br/><xsl:value-of select="concat(変更年月日x日,'日')" /></td>
		<td class="normalct allline linerclear">船</td>
		<td class="normalrt allline linelclear">
			<xsl:call-template name="kingaku_hyoji">
				<xsl:with-param name="getsugaku" select="従前の標準報酬月額x船保"/>
			</xsl:call-template>
		</td>
		<td class="normalrt allline" colspan="2" rowspan="2"><xsl:value-of select="concat(報酬月額x金銭によるものの額,' 円')" /><br/><xsl:value-of select="concat(報酬月額x現物によるものの額,' 円')" /><br/><xsl:value-of select="concat(報酬月額x合計,' 円')" /></td>
		<td class="normalct allline linerclear">船</td>
		<td class="normalrt allline linelclear">
			<xsl:call-template name="kingaku_hyoji">
				<xsl:with-param name="getsugaku" select="標準報酬月額x船保"/>
			</xsl:call-template>
		</td>
		<td class="normal allline" rowspan="2"><xsl:value-of select="備考x変更の事由" /></td>
	</tr>

	<tr class="h_data3">
		<td class="normalct allline"><xsl:value-of select="被保険者整理番号" /></td>
		<td class="normalct allline linerclear">年</td>
		<td class="normalrt allline linelclear">
			<xsl:call-template name="kingaku_hyoji">
				<xsl:with-param name="getsugaku" select="従前の標準報酬月額x厚年"/>
			</xsl:call-template>
		</td>
		<td class="normalct allline linerclear">年</td>
		<td class="normalrt allline linelclear">
			<xsl:call-template name="kingaku_hyoji">
				<xsl:with-param name="getsugaku" select="標準報酬月額x厚年"/>
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
