<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<head>
				<META http-equiv="X-UA-Compatible" content="IE=11" />
				<title>健康保険・厚生年金保険資格喪失確認一覧表</title>
				<style type="text/css">
				<!--テーブル属性-->
					table.outline							<!--外枠-->
					{
						border				:1px solid #000000;
						width				:640px;
						height				:940px;
					}
					table.detail							<!--通知書領域テーブル-->
					{
						border-collapse		:collapse;
						width				:640px;
						table-layout		:fixed;
					}
					table.hihokensha						<!--被保険者データテーブル-->
					{
						border-collapse		:collapse;
						width				:640px;
						height				:310px;
						table-layout		:fixed;
					}
					td.outline							<!--セル定義(外枠)-->
					{
						vertical-align		:top;
						text-align			:center;
					}
					td.allline							<!--セル定義(ライン有)-->
					{
						border-top			:1px solid #000000;
						border-left			:1px solid #000000;
						border-right		:1px solid #000000;
						border-bottom		:1px solid #000000;
					}
					td.linetl							<!--セル定義(ライン有)-->
					{
						border-top			:1px solid #000000;
						border-left		:1px solid #000000;
					}
					td.linetb							<!--セル定義(ライン有)-->
					{
						border-top			:1px solid #000000;
						border-bottom		:1px solid #000000;
					}
					td.linetlr							<!--セル定義(ライン有)-->
					{
						border-top			:1px solid #000000;
						border-left		:1px solid #000000;
						border-right		:1px solid #000000;
					}
					td.linetlb							<!--セル定義(ライン有)-->
					{
						border-top			:1px solid #000000;
						border-left		:1px solid #000000;
						border-bottom		:1px solid #000000;
					}
					td.linetrb							<!--セル定義(ライン有)-->
					{
						border-top			:1px solid #000000;
						border-right		:1px solid #000000;
						border-bottom		:1px solid #000000;
					}
					td.linelb							<!--セル定義(ライン有)-->
					{
						border-left		:1px solid #000000;
						border-bottom		:1px solid #000000;
					}
					td.linelrb							<!--セル定義(ライン有)-->
					{
						border-left		:1px solid #000000;
						border-right		:1px solid #000000;
						border-bottom		:1px solid #000000;
					}
					td.linerb							<!--セル定義(ライン有)-->
					{
						border-right		:1px solid #000000;
						border-bottom		:1px solid #000000;
					}
					td.lineb							<!--セル定義(ライン有)-->
					{
						border-bottom			:1px solid #000000;
					}
					table.Lterritory
					{
						width				:320px;
						table-layout		:fixed;
					}
					table.Rterritory
					{
						width				:320px;
						table-layout		:fixed;
					}
					
				<!--フォント定義-->
					.title								<!--標題-->
					{
						font-family		:"ＭＳ ゴシック";
						font-size		:11pt;
						font-weight		:bold;
						text-align		:center;
					}
					.oshirase							<!--見出し項目-->
					{
						font-family		:"ＭＳ 明朝";
						font-size		:7pt;
						line-height		:11px;
						vertical-align	:top;
						text-align		:left;
					}
					.midashiS_C							<!--見出し項目-->
					{
						font-family		:"ＭＳ ゴシック";
						font-size		:7pt;
						text-align		:center;
					}
					.midashiS_L							<!--見出し項目-->
					{
						font-family		:"ＭＳ ゴシック";
						font-size		:7pt;
						text-align		:left;
					}
					.midashiS_L2								<!--明細データ（文字項目）-->
					{
						font-family		:"ＭＳ ゴシック";
						font-size		:7pt;
						text-align		:left;
					}
					.midashiS_R							<!--見出し項目-->
					{
						font-family		:"ＭＳ ゴシック";
						font-size		:7pt;
						text-align		:right;
					}
					.midashiM_L								<!--明細データ（文字項目）-->
					{
						font-family		:"ＭＳ ゴシック";
						font-size		:8pt;
						text-align		:left;
					}
					.midashiM_R								<!--明細データ（文字項目）-->
					{
						font-family		:"ＭＳ ゴシック";
						font-size		:8pt;
						text-align		:right;
					}
					.midashiL_L								<!--明細データ（文字項目）-->
					{
						font-family		:"ＭＳ ゴシック";
						font-size		:9pt;
						text-align		:left;
					}
					.midashiL_R								<!--明細データ（文字項目）-->
					{
						font-family		:"ＭＳ ゴシック";
						font-size		:9pt;
						text-align		:right;
					}
					.normalS_C							<!--見出し項目-->
					{
						font-family		:"ＭＳ 明朝";
						font-size		:7pt;
						text-align		:center;
					}
					.normalS_R						<!--見出し項目-->
					{
						font-family		:"ＭＳ 明朝";
						font-size		:7pt;
						text-align		:right;
					}
					.normalS_RG						<!--固定文字-->
					{
						font-family		:"ＭＳ ゴシック";
						font-size		:7pt;
						text-align		:right;
					}
					.normalS_L						<!--見出し項目-->
					{
						font-family		:"ＭＳ 明朝";
						font-size		:7pt;
						text-align		:left;
					}
					.normalS_LG						<!--固定文字-->
					{
						font-family		:"ＭＳ ゴシック";
						font-size		:7pt;
						text-align		:left;
					}
					.normalS_TL							<!--見出し項目-->
					{
						font-family		:"ＭＳ 明朝";
						font-size		:7pt;
						vertical-align	:top;
						text-align		:left;
					}
					.normalM_C								<!--明細データ（文字項目）-->
					{
						font-family		:"ＭＳ 明朝";
						font-size		:8pt;
						text-align		:center;
					}
					.normalM_R								<!--明細データ（文字項目）-->
					{
						font-family		:"ＭＳ 明朝";
						font-size		:8pt;
						text-align		:right;
					}
					.normalM_L								<!--明細データ（文字項目）-->
					{
						font-family		:"ＭＳ 明朝";
						font-size		:8pt;
						text-align		:left;
					}
					.normalM_TL								<!--明細データ（文字項目）-->
					{
						font-family		:"ＭＳ 明朝";
						font-size		:8pt;
						vertical-align	:top;
						text-align		:left;
					}
					.normalL_C								<!--明細データ（文字項目）-->
					{
						font-family		:"ＭＳ 明朝";
						font-size		:9pt;
						text-align		:center;
					}
					.normalL_R								<!--明細データ（文字項目）-->
					{
						font-family		:"ＭＳ 明朝";
						font-size		:9pt;
						text-align		:right;
					}
					.normalL_R2								<!--明細データ（文字項目）-->
					{
						font-family		:"ＭＳ 明朝";
						font-size		:8.5pt;
						text-align		:right;
					}
					.normalL_L								<!--明細データ（文字項目）-->
					{
						font-family		:"ＭＳ 明朝";
						font-size		:9pt;
						text-align		:left;
					}
					.normalL_TL								<!--明細データ（文字項目）-->
					{
						font-family		:"ＭＳ 明朝";
						font-size		:9pt;
						vertical-align	:top;
						text-align		:left;
					}
					br.kaipage							<!--改行フォント-->
					{
						font-family		:"ＭＳ ゴシック";
						font-size		:10px;
					}
					pre.oshirase
					{
						word-wrap		:break-word;
						font-family		:"ＭＳ 明朝";
						font-size		:7pt;
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
	
	<xsl:template match="N7120001">
		<xsl:if test="count(_被保険者)!=0">
		<!-- 再帰ループ呼出 -->
			<xsl:call-template name="saikiloop">
				<xsl:with-param name="end_1" select="ceiling(count(_被保険者) div 15)" />
			<xsl:with-param name="count_1" select="1" />
			</xsl:call-template>
			
		</xsl:if>
	</xsl:template>
	
	<!-- 頁スタイル呼出 -->
	<xsl:template name="saikiloop">
		<xsl:param name="end_1" />
		<xsl:param name="count_1" />
		<xsl:if test="$count_1 &lt;= $end_1">
			
			<!-- 改ページ挿入 -->
			<xsl:if test="2 &lt;= $count_1">
				<div style="page-break-after:always;" />
			</xsl:if>
			
			<table class="outline" cellpadding="20px" cellspacing="0">
				<tr>
					<td class="outline">
						<!-- 被保険者単位のデータ表示 -->
						<xsl:apply-templates select="_被保険者" mode="header">
							<xsl:with-param name="pagecnt_1" select="1" />
						</xsl:apply-templates>
						<table class="hihokensha" cellpadding="0" cellspacing="0">
							<td style="vertical-align:top;">
								<table class="detail" cellpadding="0" cellspacing="0">
									<xsl:apply-templates select="_被保険者" mode="hihokensha">
										<xsl:with-param name="pagecnt_1" select="$count_1" />
									</xsl:apply-templates>
								</table>
							</td>
						</table>
						<xsl:apply-templates select="_被保険者" mode="footer">
							<xsl:with-param name="pagecnt_1" select="1" />
						</xsl:apply-templates>
					</td>
				</tr>
			</table>
			
			<br class="kaipage" />
			
			<xsl:call-template name="saikiloop">
				<xsl:with-param name="end_1" select="$end_1" />
				<xsl:with-param name="count_1" select="$count_1 + 1" />
			</xsl:call-template>
			
		</xsl:if>
	</xsl:template>
	
	<!-- 教示文の表示 -->
	<xsl:template name="kyoji">
		<xsl:param name="count_1" />
		<xsl:if test="$count_1 = 1">
		<div style="page-break-after:always;" />
			<table class="outline" cellpadding="22px" cellspacing="0">
				<tr>
					<td class="outline">
						<!-- 教示文のデータ表示 -->
						<xsl:apply-templates select="_被保険者" mode="kyouji">
							<xsl:with-param name="pagecnt_1" select="$count_1" />
						</xsl:apply-templates>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	
	<!-- 被保険者単位のデータ表示 -->
	<xsl:template match="_被保険者" mode="header">
		<xsl:param name="pagecnt_1" />
		<xsl:if test="($pagecnt_1=position())">
			<table class="detail" cellpadding="0" cellspacing="0">
				<td style="vertical-align:top;">
				
					<table class="detail" cellpadding="0" cellspacing="0">
						<td style="vertical-align:top;">
							
							<table class="Lterritory" >
								<colgroup>
									<col width="30px" />
									<col width="245px" />
									<col width="45px" />
								</colgroup>
								<tr>
									<td></td>
									<td class="normalS_L" style="height:40px"><br/></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td class="normalS_L" style="height:20px"><xsl:value-of select="事業所郵便番号_送付先" /></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td class="normalM_TL" style="height:30px;line-height:14px;"><xsl:value-of select="事業所所在地_送付先" /></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td class="normalL_TL" style="height:30px;line-height:14px;"><xsl:value-of select="事業所名称_送付先" /></td>
									<td></td>
								</tr>
							</table>
							
							<table class="Lterritory" >
								<colgroup>
									<col width="30px" />
									<col width="160px" />
									<col width="10px" />
									<col width="15px" />
									<col width="105px" />
								</colgroup>
								<tr>
									<td></td>
									<td class="normalL_L" style="height:20px;padding-top:8px;"><xsl:value-of select="事業主氏名_送付先" /></td>
									<td></td>
									<td class="normalL_L" style="height:20px;padding-top:8px;">様</td>
									<td></td>
								</tr>
							</table>
							
							<table class="Lterritory" >
								<colgroup>
									<col width="165px" />
									<col width="80px" />
									<col width="0px" />
									<col width="27px" />
									<col width="48px" />
								</colgroup>
								<tr>
									<td></td>
									<td class="normalS_L" style="height:20px"><xsl:value-of select="通知管理番号" /></td>
									<td></td>
									<td class="normalS_R" style="height:20px"><xsl:value-of select="通知管理番号枝番" /></td>
									<td></td>
								</tr>
							</table>
						</td>
						
						<td style="vertical-align:top;">
							<table class="Rterritory" cellpadding="0" cellspacing="0">
								<colgroup>
									<col width="234px" />
									<col width="39px" />
									<col width="6px" />
									<col width="5px" />
									<col width="36px" />
								</colgroup>
								<tr>
									<td class="normalS_L" style="height:25px"><br/></td>
								</tr>
								<tr>
									<td></td>
									<td class="normalS_LG" style="height:10px"><xsl:value-of select="外字表示_固定文字" /></td>
									<td></td>
									<td class="normalS_L" style="height:10px"><xsl:value-of select="外字表示_項目" /></td>
									<td></td>
								</tr>
							</table>
							
							<table class="Rterritory" cellpadding="0" cellspacing="0">
								<colgroup>
									<col width="153px" />
									<col width="39px" />
									<col width="7px" />
									<col width="86px" />
									<col width="35px" />
									
								</colgroup>
								<tr>
									<td></td>
									<td class="normalS_LG" style="height:10px"><xsl:value-of select="到達番号_固定文字" /></td>
									<td></td>
									<td class="normalS_L" style="height:10px"><xsl:value-of select="到達番号_項目" /></td>
									<td></td>
								</tr>
							</table>
							
							<table class="Rterritory" cellpadding="0" cellspacing="0">
								<colgroup>
									<col width="55px" />
									<col width="25px" />
									<col width="3px" />
									<col width="25px" />
									<col width="212px" />
								</colgroup>
								<tr>
									<td></td>
									<td class="normalS_LG" style="height:10px"><xsl:value-of select="SC_固定文字" /></td>
									<td></td>
									<td class="normalS_L" style="height:10px"><xsl:value-of select="SC" /></td>
									<td></td>
								</tr>
								<tr>
									<td class="normalS_L" style="height:5px"><br/></td>
								</tr>
							</table>
							
							
							
							<table class="Rterritory">
								<tr>
									<td style="height:186px"></td>
								</tr>
							</table>
						</td>
					</table>
					
					<table class="detail">
						<tr>
							<td class="title" style="height:30px;">健康保険・厚生年金保険資格喪失確認一覧表</td>
						</tr>
					</table>
					
					<table class="detail" cellpadding="1" cellspacing="0">
						<colgroup>
							<col width="30px" />
							<col width="85px" />
							<col width="4px" />
							<col width="20px" />
							<col width="12px" />
							<col width="35px" />
							<col width="459px" />
						</colgroup>
						<tr>
							<td></td>
							<td class="midashiM_L" style="height:15px">事業所整理記号</td>
							<td></td>
							<td class="normalM_R" style="height:20px"><xsl:value-of select="事業所整理記号_郡市区記号" /></td>
							<td class="normalM_C" style="height:20px">-</td>
							<td class="normalM_L" style="height:20px"><xsl:value-of select="事業所整理記号_事業所記号" /></td>
							<td></td>
						</tr>
					</table>
					
					<table class="detail" cellpadding="1" cellspacing="0">
						<colgroup>
							<col width="30px" />
							<col width="80px" />
							<col width="15px" />
							<col width="30px" />
							<col width="485px" />
						</colgroup>
						<tr>
							<td></td>
							<td class="midashiM_L" style="height:15px">事業所番号</td>
							<td></td>
							<td class="normalM_R" style="height:15px"><xsl:value-of select="事業所番号" /></td>
							<td></td>
						</tr>
					</table>
				</td>
			</table>
			
			<table class="detail" cellpadding="0" cellspacing="0">
				<td style="vertical-align:top;">
					<table class="detail" cellpadding="0" cellspacing="0">
						<colgroup>
							<col width="25px"/>
							<col width="45px"/>
							<col width="160px"/>
							<col width="15px"/>
							<col width="15px"/>
							<col width="5px"/>
							<col width="15px"/>
							<col width="5px"/>
							<col width="21px"/>
							<col width="70px"/>
							<col width="15px"/>
							<col width="15px"/>
							<col width="5px"/>
							<col width="15px"/>
							<col width="5px"/>
							<col width="21px"/>
							<col width="70px"/>
							<col width="30px"/>
							<col width="12px"/>
							<col width="42px"/>
							<col width="37px"/>
						</colgroup>
						<tr>
							<td></td>
							<td class="midashiS_C allline" style="height:30px;" rowspan="2">被保険者<br/>整理番号</td>
							<td class="midashiS_C allline" rowspan="2">被保険者氏名</td>
							<td class="midashiS_L linetlr" style="padding-left:6px;" colspan="6">※1</td>
							<td class="midashiS_L linetlr" style="padding-left:6px;">※2</td>
							<td class="midashiS_L linetlr" style="padding-left:6px;" colspan="6">※1</td>
							<td class="midashiS_L linetl" style="padding-left:6px;">※3</td>
							<td class="midashiS_C allline" rowspan="2" colspan="3">基礎年金番号</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td class="midashiS_C linelrb" colspan="6">資格喪失年月日</td>
							<td class="midashiS_C linelrb">資格喪失原因</td>
							<td class="midashiS_C linelrb" colspan="6">生年月日</td>
							<td class="midashiS_C linelrb">種別</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</td>
			</table>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="_被保険者" mode="hihokensha">
		<xsl:param name="pagecnt_1" />
		<xsl:if test="($pagecnt_1=ceiling(position() div 15))">
			<colgroup>
				<col width="25px"/>
				<col width="45px"/>
				<col width="160px"/>
				<col width="15px"/>
				<col width="15px"/>
				<col width="5px"/>
				<col width="15px"/>
				<col width="5px"/>
				<col width="21px"/>
				<col width="70px"/>
				<col width="15px"/>
				<col width="15px"/>
				<col width="5px"/>
				<col width="15px"/>
				<col width="5px"/>
				<col width="21px"/>
				<col width="70px"/>
				<col width="30px"/>
				<col width="12px"/>
				<col width="42px"/>
				<col width="37px"/>
			</colgroup>
			<tr>
				<td></td>
				<xsl:if test="被保険者整理番号!=''">
					<td class="normalL_R2 linelrb" style="height:20px; padding-right:6px;">
						<xsl:call-template name="zero-padding">
							<xsl:with-param name="str" select="被保険者整理番号" />
						</xsl:call-template>
					</td>
				</xsl:if>
				<xsl:if test="被保険者整理番号=''">
					<td class="normalL_R2 linelrb" style="height:20px; padding-right:6px;">0</td>
				</xsl:if>
				<td class="normalM_C linelrb"><xsl:value-of select="被保険者漢字氏名" /></td>
				<td class="normalL_L linelb" style="padding-left:6px;"><xsl:value-of select="資格喪失年月日_元号" /></td>
				<xsl:if test="資格喪失年月日_年!=''">
					<td class="normalL_R lineb">
						<xsl:call-template name="zero-padding">
							<xsl:with-param name="str" select="資格喪失年月日_年" />
						</xsl:call-template>
					</td>
				</xsl:if>
				<xsl:if test="資格喪失年月日_年=''">
					<td class="normalL_R lineb">0</td>
				</xsl:if>
				<td class="midashiL_L lineb">．</td>
				<xsl:if test="資格喪失年月日_月!=''">
					<td class="normalL_R lineb">
						<xsl:call-template name="zero-padding">
							<xsl:with-param name="str" select="資格喪失年月日_月" />
						</xsl:call-template>
					</td>
				</xsl:if>
				<xsl:if test="資格喪失年月日_月=''">
					<td class="normalL_R lineb">0</td>
				</xsl:if>
				<td class="midashiL_L lineb">．</td>
				<xsl:if test="資格喪失年月日_日!=''">
					<td class="normalL_R lineb" style="padding-right:6px;">
						<xsl:call-template name="zero-padding">
							<xsl:with-param name="str" select="資格喪失年月日_日" />
						</xsl:call-template>
					</td>
				</xsl:if>
				<xsl:if test="資格喪失年月日_日=''">
					<td class="normalL_R linerb" style="padding-right:6px;">0</td>
				</xsl:if>
				<td class="normalM_L linelrb" style="padding-left:6px;"><xsl:value-of select="資格喪失原因" /></td>
				<td class="normalL_L linelb" style="padding-left:6px;"><xsl:value-of select="生年月日_元号" /></td>
				<xsl:if test="生年月日_年!=''">
					<td class="normalL_R lineb">
						<xsl:call-template name="zero-padding">
							<xsl:with-param name="str" select="生年月日_年" />
						</xsl:call-template>
					</td>
				</xsl:if>
				<xsl:if test="生年月日_年=''">
					<td class="normalL_R lineb">0</td>
				</xsl:if>
				<td class="midashiL_L lineb">．</td>
				<xsl:if test="生年月日_月!=''">
					<td class="normalL_R lineb">
						<xsl:call-template name="zero-padding">
							<xsl:with-param name="str" select="生年月日_月" />
						</xsl:call-template>
					</td>
				</xsl:if>
				<xsl:if test="生年月日_月=''">
					<td class="normalL_R lineb">0</td>
				</xsl:if>
				<td class="midashiL_L lineb">．</td>
				<xsl:if test="生年月日_日!=''">
					<td class="normalL_R linerb" style="padding-right:6px;">
						<xsl:call-template name="zero-padding">
							<xsl:with-param name="str" select="生年月日_日" />
						</xsl:call-template>
					</td>
				</xsl:if>
				<xsl:if test="生年月日_日=''">
					<td class="normalL_R linerb" style="padding-right:6px;">0</td>
				</xsl:if>
				<td class="normalM_L linelb" style="padding-left:6px;"><xsl:value-of select="種別" /></td>
				<td class="normalM_L linelb" style="padding-left:8px;"><xsl:value-of select="基礎年金番号_上4桁" /></td>
				<td class="normalM_C lineb">-</td>
				<td class="normalM_L linerb"><xsl:value-of select="基礎年金番号_下6桁" /></td>
				<td></td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="_被保険者" mode="footer">
		<xsl:param name="pagecnt_1" />
		<xsl:if test="($pagecnt_1=position())">
			
			<table class="detail" cellpadding="1" cellspacing="0">
				<td style="vertical-align:top;">
					<table class="detail" >
						<colgroup>
							<col width="25px" />
						<col width="605px" />
						</colgroup>
						<tr>
							<td></td>
							<td class="normalS_L" style="height:20px">※1　元号　　　　　S：昭和　H：平成　R：令和</td>
						</tr>
						<tr>
							<td></td>
							<td class="normalS_L" style="height:25px">※2　喪失原因　　　4（他）：退職等　5（死亡）：死亡　6（70）：70歳到達による厚生年金保険のみ喪失<br/>　　　　　　　　　 7（75）：75歳到達による健康保険のみ喪失　9（障害）：障害認定　3（快復）：障害の快復<br/>　　　　　　　　　 ※喪失原因コードは先頭に0が付与される場合あり（例:04（他）：退職等）</td>
						</tr>
						<tr>
							<td></td>
							<td class="normalS_L" style="height:25px">※3　種別　　　　　第一種：男性　第二種：女性　第三種：坑内員　特例第一種：男性（基金加入）　特例第二種：女性（基金加入）<br/>　　　　　　　　　 特例第三種：坑内員（基金加入）</td>
						</tr>
						<tr>
							<td></td>
							<td class="normalS_L" style="height:25px;padding-left:15px;"></td>
						</tr>
					</table>
				</td>
			</table>
			
			<table class="detail" cellpadding="1" cellspacing="0">
				<td style="vertical-align:top;">
					<table class="detail" >
						<colgroup>
							<col width="367px" />
							<col width="270px" />
						</colgroup>
						<tr>
							<td></td>
							<xsl:if test="通知年月日!=''">
								<td class="normalM_L" style="height:18px"><xsl:value-of select="通知年月日" /></td>
							</xsl:if>
							<xsl:if test="通知年月日=''">
								<td class="normalM_L" style="height:18px">      年　月　日</td>
							</xsl:if>
						</tr>
					</table>
					
					<table class="detail" >
						<colgroup>
							<col width="350px" />
							<col width="287px" />
						</colgroup>
						<tr>
							<td></td>
							<td class="normalM_L" style="height:18px"><xsl:value-of select="初回発行年月日" /></td>
						</tr>
					</table>
					
					<table class="detail" >
						<colgroup>
							<col width="367px" />
							<col width="270px" />
						</colgroup>
						<tr>
							<td></td>
							<td class="normalM_L" style="height:18px"></td>
						</tr>
						<tr>
							<td></td>
							<td class="normalM_L" style="height:18px">（<xsl:value-of select="年金事務所名" />）</td>
						</tr>
					</table>
				</td>
			</table>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="zero-padding">
		<xsl:param name="str"/>
		<xsl:choose>
			<xsl:when test="$str!=''"><xsl:value-of select="number($str)"/></xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="*">
		<xsl:value-of select="." disable-output-escaping="yes" />
	</xsl:template>
	
</xsl:stylesheet>
