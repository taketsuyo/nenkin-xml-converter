<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<html>
		<head>
			<META http-equiv="X-UA-Compatible" content="IE=11" />
			<title>健康保険法第１１８条第１項　該当・不該当一覧表</title>
			<style type="text/css">
			<!--テーブル属性-->
				table.outline						<!--外枠-->
				{
					border			:1px solid #000000;
					width			:935px;
					height			:632px;
				}
				table.detail						<!--通知書領域テーブル-->
				{
					border-collapse	:collapse;
					width			:895px;
					table-layout	:fixed;
				}
				table.dispArea
				{
					border-collapse	:collapse;
					width			:895px;
					height			:415px;
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
					height			:20px;
				}
				tr.h_data2							<!--セル高さ定義-->
				{
					height			:30px;
				}
				tr.h_data3							<!--セル高さ定義-->
				{
					height			:70px;
				}
				tr.h_data4							<!--セル高さ定義-->
				{
					height			:53px;
				}

			<!--フォント定義-->
				.title								<!--標題-->
				{
					font-family		:"ＭＳ ゴシック";
					font-size		:14pt;
					font-weight		:bold;
					text-align		:left;
				}
				.midashi							<!--見出し項目-->
				{
					font-family		:"ＭＳ ゴシック";
					font-size		:10pt;
					text-align		:left;
				}
				.midashict							<!--見出し項目-->
				{
					font-family		:"ＭＳ ゴシック";
					font-size		:10pt;
					text-align		:center;
				}
				.midashirt							<!--見出し項目-->
				{
					font-family		:"ＭＳ ゴシック";
					font-size		:10pt;
					text-align		:right;
				}
				.normal								<!--明細データ（文字項目）-->
				{
					font-family		:"ＭＳ 明朝";
					font-size		:10pt;
					text-align		:left;
				}
				.normalct							<!--明細データ（文字項目）-->
				{
					font-family		:"ＭＳ 明朝";
					font-size		:10pt;
					text-align		:center	;
				}
				.normalrt							<!--明細データ（文字項目）-->
				{
					font-family		:"ＭＳ 明朝";
					font-size		:10pt;
					text-align		:right;
				}
				.gengou								<!--明細データ（文字項目）-->
				{
					font-family		:"ＭＳ 明朝";
					font-size		:10pt;
					text-align		:left;
				}
				.kinsoku							<!--禁則解除-->
				{
			<!--	word-break		:break-all;	-->
				}
				br									<!--改行フォント-->
				{
					font-family		:"ＭＳ 明朝";
					font-size		:10pt;
				}
				br.small							<!--改行フォント-->
				{
					font-family		:"ＭＳ 明朝";
					font-size		:5pt;
				}

			</style>
		</head>
	
		<body style="word-break:break-all;">
			<table border="0" width="100%" style="center" >
				<tr>
					<td  align="center" style="vertical-align:top;">
												<!--外枠-->
						<table class="outline" cellpadding="20px">
							<tr>
								<td class="outline">
									<xsl:apply-templates />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</body>
	</html>
</xsl:template>

<xsl:template match="N2018003">
	<table class="dispArea">
		<tr>
			<td style="vertical-align:top;">
				<!-- タイトル作成・被保険者証の記号表示 -->
				<table class="detail">
					<colgroup>
						<col width="92px"/>
						<col width="90px"/>
					</colgroup>
					<tr>
						<td class="midashict allline" colspan="2">事業所整理記号</td>
						<td class="title">　　　健康保険法第１１８条第１項　該当・不該当一覧表</td>
					</tr>
					<tr class="h_data1">
						<td class="normalct linetlr"><xsl:value-of select="事業所整理記号x郡市区記号" /></td>
						<td class="normalct linetlr" rowspan="2"><xsl:value-of select="事業所整理記号x記号" /></td>
						<td rowspan="2"><br/></td>
					</tr>
					<tr class="h_data1">
						<td class="normalct linetlr"><xsl:value-of select="事業所整理記号x郡市区符号" /></td>
					</tr>
				</table>

				<!--　被保険者単位のデータ表示　-->
				<table class="detail" cellpadding="0" cellspacing="0">
					<colgroup>
						<col width="92px"/>
						<col width="190px"/>
						<col width="35px"/>
						<col width="80px"/>
						<col width="45px"/>
						<col width="35px"/>
						<col width="65px"/>
						<col width="60px"/>
						<col width="90px"/>
						<col width="95px"/>
					</colgroup>

					<tr>
						<td class="midashict allline">被保険者<br/>整理番号</td>
						<td class="midashict allline">被　保　険　者　の　氏　名</td>
						<td class="midashict allline">性別</td>
						<td class="midashict allline">生年月日</td>
						<td class="midashirt allline linerclear">該　当<br/>不該当</td>
						<td class="midashi allline linelclear">の別</td>
						<td class="midashirt allline linerclear">該　当<br/>不該当</td>
						<td class="midashi allline linelclear">年月日</td>
						<td class="midashirt allline linerclear">該　当<br/>不該当</td>
						<td class="midashi allline linelclear">の事由</td>
						<td class="midashict allline">備　　　考</td>
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
			<col width="125px"/>
			<col width="380px"/>
			<col width="10px"/>
		</colgroup>

		<tr>
			<td class="linetlr"><br class="small"/></td>
			<td class="linetlr"><br class="small"/></td>
			<td><br class="small"/></td>
			<td><br class="small"/></td>
		</tr>

		<tr>
			<td class="midashi linel" rowspan="2" valign="top">事業所所在地</td>
			<xsl:if test="事業所所在地x郵便番号x親番号='' and 事業所所在地x郵便番号x子番号='' ">
				<td class="normal kinsoku linel" valign="top">〒<br/></td>
			</xsl:if>
			<xsl:if test="事業所所在地x郵便番号x親番号!='' or 事業所所在地x郵便番号x子番号!='' ">
				<td class="normal kinsoku linel" valign="top">〒<xsl:value-of select="事業所所在地x郵便番号x親番号" />-<xsl:value-of select="事業所所在地x郵便番号x子番号" /></td>
			</xsl:if>
			<td class="linel"><br/></td>
			<td class="normal" rowspan="2" valign="top"></td>
		</tr>

		<tr class="h_data2">
			<td class="normal linel" valign="top"><xsl:value-of select="事業所所在地x住所" /></td>
			<td class="linel"><br/></td>
		</tr>
		<tr>
			<td class="linel"><br class="small"/></td>
			<td class="linel"><br class="small"/></td>
			<td class="linel"><br class="small"/></td>
			<td><br class="small"/></td>
		</tr>

		<tr>
			<td class="midashi linel">事業所名称</td>
			<td class="normal linel"><xsl:value-of select="事業所名称" /></td>
			<td class="linel"><br/></td>
			<td class="normalrt"><xsl:value-of select="concat('令和 ',通知年月日x年,' 年 ',通知年月日x月,' 月 ',通知年月日x日,' 日')" /></td>
		</tr>
		<tr>
			<td class="linel"><br class="small"/></td>
			<td class="linel"><br class="small"/></td>
			<td class="linel"><br class="small"/></td>
			<td><br class="small"/></td>
		</tr>

		<tr>
			<td class="midashi linel">事業主氏名</td>
			<td class="normal linel"><xsl:value-of select="concat(事業主氏名,'　様')" /></td>
			<td class="linel"><br/></td>
		</tr>

		<tr>
			<td class="linel"><br class="small"/></td>
			<td class="linel"><br class="small"/></td>
			<td class="linel"><br class="small"/></td>
			<td><br class="small"/></td>
		</tr>

		<tr>
			<td class="midashi linel">電　　　話</td>
			<td class="normal linel">
				<xsl:if test="電話番号x市外局番!='' or 電話番号x局番!='' or 電話番号x番号!=''">
					<xsl:value-of select="concat(電話番号x市外局番,' ( ',電話番号x局番,' 局) ',電話番号x番号,' 番')" />
				</xsl:if>
			</td>
			<td class="linel"><br/></td>
			<td class="normalrt"></td>
		</tr>

		<tr>
			<td class="linel lineb"><br class="small"/></td>
			<td class="linel lineb"><br class="small"/></td>
			<td class="linel"><br class="small"/></td>
			<td><br class="small"/></td>
		</tr>

	</table>

</xsl:template>

<!--　各被保険者情報表示スタイル　-->
<xsl:template match="_被保険者">

	<tr>
		<td colspan="11"><br class="small" /></td>
	</tr>			
	<tr class="h_data4">
		<td class="normalct allline"><xsl:value-of select="被保険者整理番号" /></td>
		<td class="normal allline"><xsl:value-of select="被保険者の氏名" /></td>
		<td class="normalct allline"><xsl:value-of select="性別" /></td>
		<xsl:if test="生年月日x元号='' and 生年月日x年='' and 生年月日x月='' and 生年月日x日=''">
			<td class="normalct allline"><br/></td>
		</xsl:if>
		<xsl:if test="生年月日x元号!='' or 生年月日x年!='' or 生年月日x月!='' or 生年月日x日!=''">
			<td class="normalct allline"><xsl:value-of select="concat(生年月日x元号,生年月日x年,'.',生年月日x月,'.',生年月日x日)" /></td>
		</xsl:if>
		<td class="normalct allline" colspan="2"><xsl:value-of select="該当不該当の別" /></td>
		<td class="normalct allline" colspan="2"><div class="gengou"><xsl:value-of select="該当不該当年月日x元号" /></div><xsl:value-of select="concat(該当不該当年月日x年,' 年 ',該当不該当年月日x月,' 月 ',該当不該当年月日x日,' 日')" /></td>
		<td class="normal allline" colspan="2"><xsl:value-of select="該当不該当の事由" /></td>
		<td class="normal allline"><xsl:value-of select="備考" /></td>
	</tr>

</xsl:template>


<!--CDATA対応-->
<xsl:template match="*">
	<xsl:value-of select="." disable-output-escaping="yes" />
</xsl:template>

</xsl:stylesheet>
