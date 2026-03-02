<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<head>
				<META http-equiv="X-UA-Compatible" content="IE=11" />
				<title>健康保険・厚生年金保険資格取得確認および標準報酬決定一覧表</title>
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
					td.linetb							<!--セル定義(ライン有)-->
					{
						border-top			:1px solid #000000;
						border-bottom		:1px solid #000000;
					}
					td.linelb							<!--セル定義(ライン有)-->
					{
						border-left		:1px solid #000000;
						border-bottom		:1px solid #000000;
					}
					td.linerb							<!--セル定義(ライン有)-->
					{
						border-right		:1px solid #000000;
						border-bottom		:1px solid #000000;
					}
					td.linelrb							<!--セル定義(ライン有)-->
					{
						border-left			:1px solid #000000;
						border-right		:1px solid #000000;
						border-bottom		:1px solid #000000;
					}
					td.lineb							<!--セル定義(ライン有)-->
					{
						border-bottom		:1px solid #000000;
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
						font-family		:Yu Gothic, YuGothic;
						font-size		:11pt;
						font-weight		:bold;
						text-align		:center;
					}
					.oshirase							<!--見出し項目-->
					{
						font-family		:Yu Mincho, YuMincho;
						font-size		:7pt;
						line-height		:11px;
						vertical-align	:top;
						text-align		:left;
					}
					.midashiS_C							<!--見出し項目-->
					{
						font-family		:Yu Gothic, YuGothic;
						font-size		:7pt;
						text-align		:center;
					}
					.midashiS_L							<!--見出し項目-->
					{
						font-family		:Yu Gothic, YuGothic;
						font-size		:7pt;
						text-align		:left;
					}
					.midashiS_L2								<!--明細データ（文字項目）-->
					{
						font-family		:Yu Gothic, YuGothic;
						font-size		:7pt;
						text-align		:left;
					}
					.midashiS_R							<!--見出し項目-->
					{
						font-family		:Yu Gothic, YuGothic;
						font-size		:7pt;
						text-align		:right;
					}
					.midashiM_L								<!--明細データ（文字項目）-->
					{
						font-family		:Yu Gothic, YuGothic;
						font-size		:8pt;
						text-align		:left;
					}
					.midashiM_R								<!--明細データ（文字項目）-->
					{
						font-family		:Yu Gothic, YuGothic;
						font-size		:8pt;
						text-align		:right;
					}
					.midashiL_L								<!--明細データ（文字項目）-->
					{
						font-family		:Yu Gothic, YuGothic;
						font-size		:9pt;
						text-align		:left;
					}
					.midashiL_R								<!--明細データ（文字項目）-->
					{
						font-family		:Yu Gothic, YuGothic;
						font-size		:9pt;
						text-align		:right;
					}
					.normalS_C							<!--見出し項目-->
					{
						font-family		:Yu Mincho, YuMincho;
						font-size		:7pt;
						text-align		:center;
					}
					.normalS_R						<!--見出し項目-->
					{
						font-family		:Yu Mincho, YuMincho;
						font-size		:7pt;
						text-align		:right;
					}
					.normalS_L						<!--見出し項目-->
					{
						font-family		:Yu Mincho, YuMincho;
						font-size		:7pt;
						text-align		:left;
					}
					.normalS_TL							<!--見出し項目-->
					{
						font-family		:Yu Mincho, YuMincho;
						font-size		:7pt;
						vertical-align	:top;
						text-align		:left;
					}
					.normalM_R								<!--明細データ（文字項目）-->
					{
						font-family		:Yu Mincho, YuMincho;
						font-size		:8pt;
						text-align		:right;
					}
					.normalM_L								<!--明細データ（文字項目）-->
					{
						font-family		:Yu Mincho, YuMincho;
						font-size		:8pt;
						text-align		:left;
					}
					.normalM_TL								<!--明細データ（文字項目）-->
					{
						font-family		:Yu Mincho, YuMincho;
						font-size		:8pt;
						vertical-align	:top;
						text-align		:left;
					}
					.normalL_C								<!--明細データ（文字項目）-->
					{
						font-family		:Yu Mincho, YuMincho;
						font-size		:9pt;
						text-align		:center;
					}
					.normalL_R								<!--明細データ（文字項目）-->
					{
						font-family		:Yu Mincho, YuMincho;
						font-size		:9pt;
						text-align		:right;
					}
					.normalL_R2								<!--明細データ（文字項目）-->
					{
						font-family		:Yu Mincho, YuMincho;
						font-size		:8.5pt;
						text-align		:right;
					}
					.normalL_L								<!--明細データ（文字項目）-->
					{
						font-family		:Yu Mincho, YuMincho;
						font-size		:9pt;
						text-align		:left;
					}
					.normalL_TL								<!--明細データ（文字項目）-->
					{
						font-family		:Yu Mincho, YuMincho;
						font-size		:9pt;
						vertical-align	:top;
						text-align		:left;
					}
					br.kaipage							<!--改行フォント-->
					{
						font-family		:Yu Gothic, YuGothic;
						font-size		:10px;
					}
					pre.oshirase
					{
						word-wrap		:break-word;
						font-family		:Yu Mincho, YuMincho;
						font-size		:7pt;
					}
				</style>
			</head>
			<body style="word-break:break-all;">
				<table border="0" width="100%" style="center" >
						<td align="center" style="vertical-align:top;">
							<xsl:apply-templates/>
						</td>
				</table>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="N7100001">
		<xsl:if test="count(_被保険者)!=0">
		<!-- 再帰ループ呼出 -->
			<xsl:call-template name="saikiloop">
				<xsl:with-param name="end_1" select="ceiling(count(_被保険者) div 5)" />
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
									<td class="normalL_L" style="height:20px"><xsl:value-of select="事業主氏名_送付先" /></td>
									<td></td>
									<td class="normalL_L" style="height:20px">様</td>
									<td></td>
								</tr>
							</table>
							
							<table class="Lterritory" >
								<colgroup>
									<col width="145px" />
									<col width="100px" />
									<col width="0px" />
									<col width="35px" />
									<col width="40px" />
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
									<td class="midashiS_L" style="height:10px"><xsl:value-of select="外字表示_固定文字" /></td>
									<td></td>
									<td class="normalS_L" style="height:10px"><xsl:value-of select="外字表示_項目" /></td>
									<td></td>
								</tr>
							</table>
							
							<table class="Rterritory" cellpadding="0" cellspacing="0">
								<colgroup>
									<col width="123px" />
									<col width="39px" />
									<col width="7px" />
									<col width="116px" />
									<col width="35px" />
									
								</colgroup>
								<tr>
									<td></td>
									<td class="midashiS_L" style="height:10px"><xsl:value-of select="到達番号_固定文字" /></td>
									<td></td>
									<td class="normalS_L" style="height:10px"><xsl:value-of select="到達番号_項目" /></td>
									<td></td>
								</tr>
							</table>
							
							<table class="Rterritory" cellpadding="0" cellspacing="0">
								<colgroup>
									<col width="55px" />
									<col width="30px" />
									<col width="3px" />
									<col width="30px" />
									<col width="202px" />
								</colgroup>
								<tr>
									<td></td>
									<td class="midashiS_R" style="height:10px"><xsl:value-of select="SC_固定文字" /></td>
									<td></td>
									<td class="normalS_R" style="height:10px"><xsl:value-of select="SC" /></td>
									<td></td>
								</tr>
								<tr>
									<td class="normalS_L" style="height:5px"><br/></td>
								</tr>
							</table>
							
							
							
							<table class="Rterritory" cellpadding="3" cellspacing="0">
								<colgroup>
									<col width="40px" />
									<col width="250px" />
									<col width="30px" />
								</colgroup>
								<tr>
									<td></td>
									<td class="normalS_TL allline" style="height:185px;line-height:11px;"><pre class="oshirase"><xsl:value-of select="機構からのお知らせ" /></pre></td>
									<td></td>
								</tr>
							</table>
							
						</td>
					</table>
					
					<table class="detail">
						<tr>
							<td class="title" style="height:25px">健康保険・厚生年金保険資格取得確認および標準報酬決定一覧表</td>
						</tr>
					</table>
					
					<table class="detail" cellpadding="1" cellspacing="0">
						<colgroup>
							<col width="30px" />
							<col width="85px" />
							<col width="10px" />
							<col width="14px" />
							<col width="11px" />
							<col width="35px" />
							<col width="455px" />
						</colgroup>
						<tr>
							<td></td>
							<td class="midashiM_L" style="height:15px">事業所整理記号</td>
							<td></td>
							<td class="normalM_R" style="height:15px"><xsl:value-of select="事業所整理記号_郡市区記号" /></td>
							<td class="normalM_L" style="height:15px">-</td>
							<td class="normalM_L" style="height:15px"><xsl:value-of select="事業所整理記号_事業所記号" /></td>
							<td></td>
						</tr>
					</table>
					
					<table class="detail" cellpadding="1" cellspacing="0">
						<colgroup>
							<col width="30px" />
							<col width="80px" />
							<col width="15px" />
							<col width="40px" />
							<col width="475px" />
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
							<col width="20px"/>
							<col width="47px"/>
							<col width="8px"/>
							<col width="24px"/>
							<col width="24px"/>
							<col width="15px"/>
							<col width="54px"/>
							<col width="48px"/>
							<col width="45px"/>
							<col width="15px"/>
							<col width="15px"/>
							<col width="10px"/>
							<col width="15px"/>
							<col width="7px"/>
							<col width="15px"/>
							<col width="8px"/>
							<col width="55px"/>
							<col width="69px"/>
							<col width="55px"/>
							<col width="69px"/>
							<col width="20px"/>
						</colgroup>
						<tr>
							<td></td>
							<td class="midashiS_L2 allline" style="height:50px;padding:4" rowspan="2">被保険者整理番号</td>
							<td class="midashiS_L allline" style="padding-left:70px;" colspan="7">被保険者氏名</td>
							<td class="midashiS_L allline" style="padding-left:8px;" colspan="7">※1<br/>資格取得年月日</td>
							<td class="midashiS_L linetrb" style="padding-left:91px;" colspan="4">標準報酬月額</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td class="midashiS_L allline" style="padding-left:8px;" colspan="4">※1<br/>生年月日</td>
							<td class="midashiS_L allline" style="padding-left:4px;">※2<br/>種別(性別)</td>
							<td class="midashiS_L allline" style="padding-left:5px;">※3<br/>取得区分</td>
							<td class="midashiS_L2 allline" style="padding-left:3px;">被保険者区分</td>
							<td class="midashiS_L allline" style="padding-left:13px;" colspan="7">基礎年金番号</td>
							<td class="midashiS_L linetb" style="padding-left:10px;">郵便番号</td>
							<td class="midashiS_L linetrb" style="padding-left:35px;" colspan="3">被保険者住所</td>
							<td></td>
						</tr>
					</table>
				</td>
			</table>
		</xsl:if>
	</xsl:template>
			
	<xsl:template match="_被保険者" mode="hihokensha">
		<xsl:param name="pagecnt_1" />
		<xsl:if test="($pagecnt_1=ceiling(position() div 5))">
			<colgroup>
				<col width="20px"/>
				<col width="47px"/>
				<col width="8px"/>
				<col width="24px"/>
				<col width="24px"/>
				<col width="15px"/>
				<col width="54px"/>
				<col width="48px"/>
				<col width="45px"/>
				<col width="15px"/>
				<col width="15px"/>
				<col width="10px"/>
				<col width="15px"/>
				<col width="7px"/>
				<col width="15px"/>
				<col width="8px"/>
				<col width="55px"/>
				<col width="69px"/>
				<col width="55px"/>
				<col width="69px"/>
				<col width="20px"/>
			</colgroup>
			<tr>
				<td></td>
				<td class="normalL_R2 linelrb" style="height:50px;padding-right:6px;" rowspan="2">
					<xsl:call-template name="zero-padding">
						<xsl:with-param name="str" select="被保険者整理番号"/>
					</xsl:call-template>
				</td>
				<td class="normalM_L linelrb" style="padding-left:20px;height:30px;" colspan="7"><xsl:value-of select="被保険者カナ氏名" /><br/><xsl:value-of select="被保険者漢字氏名" /></td>
				<td class="normalL_L linelb" style="padding-left:6px;"><xsl:value-of select="資格取得年月日_元号" /></td>
				<td class="normalL_R lineb">
					<xsl:call-template name="zero-padding">
						<xsl:with-param name="str" select="資格取得年月日_年"/>
					</xsl:call-template>
				</td>
				<td class="normalL_L lineb">．</td>
				<td class="normalL_R lineb">
					<xsl:call-template name="zero-padding">
						<xsl:with-param name="str" select="資格取得年月日_月"/>
					</xsl:call-template>
				</td>
				<td class="normalL_L lineb">．</td>
				<td class="normalL_R lineb">
					<xsl:call-template name="zero-padding">
						<xsl:with-param name="str" select="資格取得年月日_日"/>
					</xsl:call-template>
				</td>
				<td class="linerb"></td>
				<td class="normalL_L linelb" style="padding-left:5px;">健保：</td>
				<td class="normalL_R lineb" style="padding-right:3px;"><xsl:value-of select="標準報酬月額_健保" /></td>
				<td class="normalL_L linelb" style="padding-left:5px;">厚年：</td>
				<td class="normalL_R linerb" style="padding-right:3px;"><xsl:value-of select="標準報酬月額_厚年" /></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td class="normalS_L linelb" style="padding-left:2px;"><xsl:value-of select="生年月日_元号" /></td>
				<td class="normalS_R lineb">
					<xsl:call-template name="zero-padding2">
						<xsl:with-param name="str" select="生年月日_年"/>
					</xsl:call-template>
				</td>
				<td class="normalS_R lineb">
					<xsl:call-template name="zero-padding2">
						<xsl:with-param name="str" select="生年月日_月"/>
					</xsl:call-template>
				</td>
				<td class="normalS_R linerb" style="padding-right:3px;">
					<xsl:call-template name="zero-padding">
						<xsl:with-param name="str" select="生年月日_日"/>
					</xsl:call-template>
				</td>
				<td class="normalM_L linelrb" style="padding-left:3px;font-size:6pt;" ><xsl:value-of select="種別_性別" /></td>
				<td class="normalM_L linelrb" style="padding-left:6px;font-size:6pt;"><xsl:value-of select="取得区分" /></td>
				<td class="normalM_L linelrb" style="padding-left:6px;font-size:6pt;"><xsl:value-of select="被保険者区分" /></td>
				<td class="normalL_L linelb" style="padding-left:2px;font-size:7pt;" colspan="2"><xsl:value-of select="基礎年金番号_上4桁" /></td>
				<td class="normalL_L lineb" style="padding-left:4px;" colspan="1">-</td>
				<td class="normalL_L linerb" style="padding-left:4px;font-size:7pt;" colspan="4"><xsl:value-of select="基礎年金番号_下6桁" /></td>
				<td class="normalM_TL linelb" style="padding-top:5px;padding-left:4px;font-size:7pt;"><xsl:value-of select="郵便番号" /></td>
				<td class="normalS_TL linerb" colspan="3" style="height:30px;padding-top:4px;padding-right:0px;"><xsl:value-of select="被保険者漢字住所" /></td>
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
							<td class="normalM_L" style="height:20px">※1　元号　　　　　S：昭和　H：平成　R：令和</td>
						</tr>
						<tr>
							<td></td>
							<td class="normalM_L" style="height:25px">※2　種別（性別）　1（男）：男性　2（女）：女性　3（坑）：坑内員　5（基男）：男性（基金加入）<br/>　　　　　　　　　 6（基女）：女性(基金加入）　7（基坑）：坑内員（基金加入）</td>
						</tr>
						<tr>
							<td></td>
							<td class="normalM_L" style="height:25px">※3　取得区分　　　1（新）：新規加入　2（再）：再取得　3（共）：共済組合　4（船）：船員保険　5（新）：新規取得<br/>　　　　　　　　　 6（再）：再取得</td>
						</tr>
						<tr>
							<td></td>
							<td class="normalM_L" style="height:30px;padding-left:15px;"></td>
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
							<td class="normalM_L" style="height:18px">
								<xsl:if test="通知年月日!=''">
									<xsl:value-of select="通知年月日" />
								</xsl:if>
								<xsl:if test="通知年月日=''">
								      年　月　日
								</xsl:if>
							</td>
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
			<xsl:when test="$str=''">0</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="zero-padding2">
		<xsl:param name="str"/>
		<xsl:choose>
			<xsl:when test="$str!=''"><xsl:value-of select="number($str)"/>．</xsl:when>
			<xsl:when test="$str=''">0．</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="*">
		<xsl:value-of select="." disable-output-escaping="yes" />
	</xsl:template>
	
</xsl:stylesheet>
