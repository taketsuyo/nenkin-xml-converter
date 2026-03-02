<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<head>
				<META http-equiv="X-UA-Compatible" content="IE=11" />
				<title>健康保険・厚生年金保険資格取得確認および標準報酬決定一覧表</title>
				<style type="text/css">
				<!--テーブル属性-->
					table.outline						<!--外枠-->
					{
						border				:1px solid #000000;
						width				:640px;
						height				:940px;
					}
					table.detail						<!--通知書領域テーブル-->
					{
						border-collapse		:collapse;
						width				:640px;
						table-layout		:fixed;
					}
					table.hihokensha					<!--被保険者データテーブル-->
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
					td.linelrb							<!--セル定義(ライン有)-->
					{
						border-left			:1px solid #000000;
						border-right		:1px solid #000000;
						border-bottom		:1px solid #000000;
					}
					td.linetlb							<!--セル定義(ライン有)-->
					{
						border-top			:1px solid #000000;
						border-left			:1px solid #000000;
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
						border-left			:1px solid #000000;
						border-bottom		:1px solid #000000;
					}
					td.linerb							<!--セル定義(ライン有)-->
					{
						border-right		:1px solid #000000;
						border-bottom		:1px solid #000000;
					}
					td.lineb							<!--セル定義(ライン有)-->
					{
						border-bottom		:1px solid #000000;
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
						font-size		:11pt;
						font-weight		:bold;
						text-align		:center;
					}
					.midashiS_R							<!--明細データ（文字項目）-->
					{
						font-family		:YuGothic, Yu Gothic;
						font-size		:7pt;
						text-align		:right;
					}
					.midashiS_L							<!--明細データ（文字項目）-->
					{
						font-family		:YuGothic, Yu Gothic;
						font-size		:7pt;
						text-align		:left;
					}
					.midashiS_TL								<!--明細データ（文字項目）-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:7pt;
						vertical-align	:top;
						text-align		:left;
					}
					.midashiM_R								<!--明細データ（文字項目）-->
					{
						font-family		:YuGothic, Yu Gothic;
						font-size		:8pt;
						text-align		:right;
					}
					.midashiM_L								<!--明細データ（文字項目）-->
					{
						font-family		:YuGothic, Yu Gothic;
						font-size		:8pt;
						text-align		:left;
					}
					.midashiL_L								<!--明細データ（文字項目）-->
					{
						font-family		:YuGothic, Yu Gothic;
						font-size		:9pt;
						text-align		:left;
					}
					.normalS_R							<!--明細データ（文字項目）-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:7pt;
						text-align		:right;
					}
					.normalS_L							<!--明細データ（文字項目）-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:7pt;
						text-align		:left;
					}
					.normalS_TL								<!--明細データ（文字項目）-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:7pt;
						vertical-align	:top;
						text-align		:left;
					}
					.normalM_R								<!--明細データ（文字項目）-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:8pt;
						text-align		:right;
					}
					.normalM_L								<!--明細データ（文字項目）-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:8pt;
						text-align		:left;
					}
					.normalM_TL								<!--明細データ（文字項目）-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:8pt;
						vertical-align	:top;
						text-align		:left;
					}
					.normalL_R								<!--明細データ（文字項目）-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:9pt;
						text-align		:right;
					}
					.normalL_R2								<!--明細データ（文字項目）-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:8.5pt;
						text-align		:right;
					}
					.normalL_L								<!--明細データ（文字項目）-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:9pt;
						text-align		:left;
					}
					.normalL_TL								<!--明細データ（文字項目）-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:9pt;
						vertical-align	:top;
						text-align		:left;
					}
					br.kaipage							<!--改行フォント-->
					{
						font-family		:YuGothic, Yu Gothic;
						font-size		:10px;
					}
					pre.oshirase 
					{
						word-wrap :break-word;
						font-family :YuMincho, Yu Mincho;
						font-size :7pt;
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
	
	<xsl:template match="N7110001">
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
			<table class="outline" cellpadding="20px" cellspacing="0">
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
									<td style="height:40px"></td>
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
									<td class="normalL_L" style="height:20px"><xsl:value-of select="手作業通知書固定01" /></td>
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
									<td class="normalS_L" style="height:20px"><xsl:value-of select="通知管理番号枝番" /></td>
									<td></td>
								</tr>
							</table>
						</td>
						
						<td style="vertical-align:top;">
							<table class="Rterritory" cellpadding="0" cellspacing="0">
								<colgroup>
									<col width="234px" />
									<col width="40px" />
									<col width="5px" />
									<col width="5px" />
									<col width="36px" />
								</colgroup>
								<tr>
									<td style="height:25px"></td>
								</tr>
								<tr>
									<td></td>
									<td class="midashiS_R" style="height:10px">
										<xsl:if test="外字表示='#'">
											<xsl:value-of select="手作業通知書固定02" />
										</xsl:if>
										<xsl:if test="外字表示!='#'">
										</xsl:if>
									</td>
									<td></td>
									<td class="normalS_R" style="height:10px"><xsl:value-of select="外字表示" /></td>
									<td></td>
								</tr>
							</table>
							
							<table class="Rterritory" cellpadding="0" cellspacing="0">
								<colgroup>
									<col width="122px" />
									<col width="50px" />
									<col width="3px" />
									<col width="120px" />
									<col width="25px" />
									
								</colgroup>
								<tr>
									<td></td>
									<td class="midashiS_R" style="height:10px">
										<xsl:if test="到達番号!=''">
											<xsl:value-of select="手作業通知書固定03" />
										</xsl:if>
										<xsl:if test="到達番号=''">
										</xsl:if>
									</td>
									<td></td>
									<td class="normalS_R" style="height:10px"><xsl:value-of select="到達番号" /></td>
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
									<td class="midashiS_R" style="height:10px">
										<xsl:if test="SC!=''">
											<xsl:value-of select="手作業通知書固定04" />
										</xsl:if>
										<xsl:if test="SC=''">
										</xsl:if>
									</td>
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
									<td class="midashiS_TL allline" style="height:185px;line-height:11px;">
										<pre class="oshirase">
											<xsl:call-template name="loop">
												<xsl:with-param name="str" select="手作業通知書固定05" />
											</xsl:call-template>
										</pre>
									</td>
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
							
							<col width="25px" />
							<col width="10px" />
							<col width="35px" />
							
							<col width="445px" />
						</colgroup>
						<tr>
							<td></td>
							<td class="midashiM_L" style="height:15px"><xsl:value-of select="手作業通知書固定07" /></td>
							<td></td>
							<td class="normalM_L" style="height:15px"><xsl:value-of select="事業所整理記号_郡市区記号" /></td>
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
							<col width="45px" />
							<col width="470px" />
						</colgroup>
						<tr>
							<td></td>
							<td class="midashiM_L" style="height:15px"><xsl:value-of select="手作業通知書固定08" /></td>
							<td></td>
							<td class="normalM_L" style="height:15px"><xsl:value-of select="事業所番号" /></td>
							<td></td>
						</tr>
					</table>
					
				</td>
			</table>
			
			<table class="detail" cellpadding="0" cellspacing="0">
				<td style="vertical-align:top;">
					<table class="detail" cellpadding="0" cellspacing="0">
						<colgroup>
							<col width="11px"/>
							<col width="47px"/>
							<col width="8px"/>
							<col width="16px"/>
							<col width="16px"/>
							<col width="16px"/>
							<col width="60px"/>
							<col width="50px"/>
							<col width="45px"/>
							<col width="15px"/>
							<col width="15px"/>
							<col width="10px"/>
							<col width="15px"/>
							<col width="7px"/>
							<col width="15px"/>
							<col width="8px"/>
							<col width="58px"/>
							<col width="66px"/>
							<col width="58px"/>
							<col width="66px"/>
							<col width="11px"/>
						</colgroup>
						<tr>
							<td></td>
							<td class="midashiS_L allline" style="height:50px;padding:4" rowspan="2"><xsl:value-of select="手作業通知書固定09" /></td>
							<td class="midashiS_L allline" style="padding-left:70px;" colspan="7"><xsl:value-of select="手作業通知書固定10" /></td>
							<td class="midashiS_L allline" style="padding-left:8px;" colspan="7"><xsl:value-of select="手作業通知書固定11" /><br/><xsl:value-of select="手作業通知書固定12" /></td>
							<td class="midashiS_L linetrb" style="padding-left:98px;" colspan="4"><xsl:value-of select="手作業通知書固定13" /></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td class="midashiS_L allline" style="padding-left:8px;" colspan="4"><xsl:value-of select="手作業通知書固定14" /><br/><xsl:value-of select="手作業通知書固定15" /></td>
							<td class="midashiS_L allline" style="padding-left:1px;"><xsl:value-of select="手作業通知書固定16" /><br/><xsl:value-of select="手作業通知書固定17" /></td>
							<td class="midashiS_L allline" style="padding-left:5px;"><xsl:value-of select="手作業通知書固定18" /><br/><xsl:value-of select="手作業通知書固定19" /></td>
							<td class="midashiS_L allline" style="padding-left:3px;"><xsl:value-of select="手作業通知書固定20" /></td>
							<td class="midashiS_L allline" style="padding-left:13px;" colspan="7"><xsl:value-of select="手作業通知書固定21" /></td>
							<td class="midashiS_L linetb" style="padding-left:10px;"><xsl:value-of select="手作業通知書固定22" /></td>
							<td class="midashiS_L linetrb" style="padding-left:40px;" colspan="3"><xsl:value-of select="手作業通知書固定23" /></td>
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
				<col width="11px"/>
				<col width="47px"/>
				<col width="8px"/>
				<col width="16px"/>
				<col width="16px"/>
				<col width="16px"/>
				<col width="60px"/>
				<col width="50px"/>
				<col width="45px"/>
				<col width="15px"/>
				<col width="18px"/>
				<col width="5px"/>
				<col width="18px"/>
				<col width="5px"/>
				<col width="19px"/>
				<col width="5px"/>
				<col width="58px"/>
				<col width="40px"/>
				<col width="26px"/>
				<col width="58px"/>
				<col width="40px"/>
				<col width="26px"/>
				<col width="11px"/>
			</colgroup>
			<tr>
				<td></td>
				<td class="normalL_R2 linelrb" style="height:50px;padding-right:2px;" rowspan="2"><xsl:value-of select="被保険者整理番号" /></td>
				<td class="normalM_L linelrb" style="padding-left:20px;height:30px;" colspan="7"><xsl:value-of select="被保険者カナ氏名" /><br/><xsl:value-of select="被保険者漢字氏名" /></td>
				<td class="normalL_L linelb" style="padding-left:6px;"><xsl:value-of select="資格取得年月日_元号" /></td>
				<td class="normalL_R lineb" ><xsl:value-of select="資格取得年月日_年" /></td>
				<td class="normalL_L lineb">．</td>
				<td class="normalL_R lineb"><xsl:value-of select="資格取得年月日_月" /></td>
				<td class="normalL_L lineb">．</td>
				<td class="normalL_R lineb"><xsl:value-of select="資格取得年月日_日" /></td>
				<td class="linerb"></td>
				<td class="normalL_L linelb" style="padding-left:5px;"><xsl:value-of select="手作業通知書固定24" /></td>
				<td class="normalL_R lineb" style="padding-right:5px;"><xsl:value-of select="標準報酬月額_健保" /></td>
				<td class="normalL_L linerb"><xsl:value-of select="手作業通知書固定25" /></td>
				<td class="normalL_L linelb" style="padding-left:5px;"><xsl:value-of select="手作業通知書固定26" /></td>
				<td class="normalL_R lineb" style="padding-right:5px;"><xsl:value-of select="標準報酬月額_厚年" /></td>
				<td class="normalL_L linerb"><xsl:value-of select="手作業通知書固定27" /></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td class="normalS_L linelb" style="padding-left:2px;"><xsl:value-of select="生年月日_元号" /></td>
				<td class="normalS_R lineb"><xsl:value-of select="生年月日_年" />.</td>
				<td class="normalS_R lineb"><xsl:value-of select="生年月日_月" />.</td>
				<td class="normalS_R linerb" style="padding-right:3px;"><xsl:value-of select="生年月日_日" /></td>
				<td class="normalM_L allline"><xsl:value-of select="種別_性別" /></td>
				<td class="normalM_L allline" style="padding-left:3px;"><xsl:value-of select="取得区分" /></td>
				<td class="normalM_L allline" style="padding-left:5px;"><xsl:value-of select="被保険者区分" /></td>
				<td class="normalL_L linelb" style="padding-left:2px;font-size:8pt" colspan="2"><xsl:value-of select="基礎年金番号_上4桁" /></td>
				<td class="normalL_L lineb" style="padding-left:4px;" colspan="1">-</td>
				<td class="normalL_L linerb" style="padding-left:4px;font-size:8pt" colspan="4"><xsl:value-of select="基礎年金番号_下6桁" /></td>
				<td class="normalM_TL linelb" style="padding:4px;font-size:7pt;"><xsl:value-of select="郵便番号" /></td>
				<td class="normalS_TL linerb" colspan="5" style="height:30px;padding-top:4px;padding-right:6px;"><xsl:value-of select="被保険者漢字住所" /></td>
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
							<col width="25px"/>
							<col width="30px"/>
							<col width="5px"/>
							<col width="60px"/>
							<col width="15px"/>
							<col width="505px"/>
						</colgroup>
						<tr>
							<td></td>
							<td class="normalS_L" style="height:15px"><xsl:value-of select="手作業通知書固定28" /></td>
							<td></td>
							<td class="normalS_L" style="height:15px"><xsl:value-of select="手作業通知書固定29" /></td>
							<td></td>
							<td class="normalS_L" style="height:15px"><xsl:value-of select="手作業通知書固定30" /></td>
						</tr>
						<tr>
							<td></td>
							<td class="normalS_L" style="height:15px"><xsl:value-of select="手作業通知書固定31" /></td>
							<td></td>
							<td class="normalS_L" style="height:15px"><xsl:value-of select="手作業通知書固定32" /></td>
							<td></td>
							<td class="normalS_L" style="height:15px"><xsl:value-of select="手作業通知書固定33" /></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td class="normalS_L" style="height:15px"><xsl:value-of select="手作業通知書固定34" /></td>
						</tr>
						<tr>
							<td></td>
							<td class="normalS_L" style="height:15px"><xsl:value-of select="手作業通知書固定35" /></td>
							<td></td>
							<td class="normalS_L" style="height:15px"><xsl:value-of select="手作業通知書固定36" /></td>
							<td></td>
							<td class="normalS_L" style="height:15px"><xsl:value-of select="手作業通知書固定37" /></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td class="normalS_L" style="height:15px"><xsl:value-of select="手作業通知書固定38" /></td>
						</tr>
					</table>
					
					<table class="detail" >
						<colgroup>
							<col width="40px"/>
							<col width="600px"/>
						</colgroup>
							<tr>
								<td class="normalS_L" style="height:1px"><br/></td>
							</tr>
						<tr>
							<td></td>
							<td class="normalM_L" style="height:15px"></td>
						</tr>
					</table>
				</td>
			</table>
			
			<table class="detail" cellpadding="1" cellspacing="0">
				<td style="vertical-align:top;">
					<table class="detail" >
						<colgroup>
							<col width="330px" />
							<col width="310px" />
						</colgroup>
						<tr>
							<td></td>
							<td class="normalM_L" style="height:15px"><xsl:value-of select="通知年月日" /></td>
						</tr>
					</table>
					
					<table class="detail" >
						<colgroup>
							<col width="321px" />
							<col width="319px" />
						</colgroup>
						<tr>
							<td></td>
							<td class="normalM_L" style="height:15px"><xsl:value-of select="初回発行年月日" /></td>
						</tr>
					</table>
					
					<table class="detail" >
						<colgroup>
							<col width="335px" />
							<col width="184px" />
							<col width="121px" />
						</colgroup>
						<tr>
							<td></td>
							<td class="normalM_R" style="height:15px"></td>
							<td></td>
						</tr>
					</table>
					
					<table class="detail" >
						<colgroup>
							<col width="325px" />
							<col width="315px" />
						</colgroup>
						<tr>
							<td></td>
							<td class="normalM_L" style="height:15px">
								<xsl:if test="年金事務所名!=''">
									（<xsl:value-of select="年金事務所名" />）
								</xsl:if>
								<xsl:if test="年金事務所名=''">
								</xsl:if>
							</td>
						</tr>
					</table>
				</td>
			</table>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*">
		<xsl:value-of select="." disable-output-escaping="yes" />
	</xsl:template>
	
	<!--br対応-->
	<xsl:template name="loop">
		<xsl:param name="str"/>
		<xsl:choose>
			<xsl:when test="contains($str,'&lt;br/>')">
				<xsl:variable name="sub" select="substring-before($str,'&lt;br/>')"/>
				<xsl:value-of select="$sub" disable-output-escaping="yes" />
					<br/>
					
					<xsl:call-template name="loop">
						<xsl:with-param name="str" select="substring-after($str,'&lt;br/>')"/>
					</xsl:call-template>
			</xsl:when>
			
			<xsl:otherwise>
				<xsl:value-of select="$str" disable-output-escaping="yes" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>
