<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<head>
				<META http-equiv="X-UA-Compatible" content="IE=11" />
				<title>定時決定に係る年間報酬額算定の不該当一覧表</title>
				<style type="text/css">
				<!--テーブル属性-->
					table.outline						<!--外枠-->
					{
						border			:1px solid #000000;
						width			:640px;
						height			:940px;
					}
					table.detail						<!--通知書領域テーブル-->
					{
						border-collapse		:collapse;
						width			:640px;
						table-layout		:fixed;
					}
					table.detail2
					{
						border-collapse		:collapse;
						width			:280px;
						table-layout		:fixed;
					}
					table.hihokensha					<!--被保険者データテーブル-->
					{
						border-collapse		:collapse;
						width				:640px;
						height				:170px;
						table-layout		:fixed;
					}
					table.Lterritory
					{
						width		:320px;
						table-layout		:fixed;
					}
					table.Rterritory
					{
						width		:320px;
						table-layout		:fixed;
					}
					td.outline							<!--セル定義(外枠)-->
					{
						vertical-align		:top;
						text-align		:center;
					}
					td.allline							<!--セル定義(ライン有)-->
					{
						border-top		:1px solid #000000;
						border-left		:1px solid #000000;
						border-right		:1px solid #000000;
						border-bottom		:1px solid #000000;
					}
					td.linet							<!--セル定義(ライン有)-->
					{
						border-top		:1px solid #000000;
					}
					td.linel							<!--セル定義(ライン有)-->
					{
						border-left		:1px solid #000000;
						
						height			:10px;
					}
					td.liner							<!--セル定義(ライン有)-->
					{
						border-right		:1px solid #000000;
					}
					td.lineb							<!--セル定義(ライン有)-->
					{
						border-bottom		:1px solid #000000;
					}
					td.linetb							<!--セル定義(ライン有)-->
					{
						border-top			:1px solid #000000;
						border-bottom		:1px solid #000000;
					}
					td.linetrb							<!--セル定義(ライン有)-->
					{
						border-top			:1px solid #000000;
						border-right		:1px solid #000000;
						border-bottom		:1px solid #000000;
					}
					td.linetr							<!--セル定義(ライン有)-->
					{
						border-top			:1px solid #000000;
						border-left			:1px solid #ffffff;
						border-right		:1px solid #000000;
						border-bottom		:1px solid #ffffff;
						border-top-right-radius: 30px;
					}
					td.linetl							<!--セル定義(ライン有)-->
					{
						border-top			:1px solid #000000;
						border-left			:1px solid #000000;
						border-right		:1px solid #ffffff;
						border-bottom		:1px solid #ffffff;
						border-top-left-radius: 30px;
					}
					td.linerb							<!--セル定義(ライン有)-->
					{
						border-top			:1px solid #ffffff;
						border-left			:1px solid #ffffff;
						border-right		:1px solid #000000;
						border-bottom		:1px solid #000000;
						border-bottom-right-radius: 30px;
					}
					td.linelrb							<!--セル定義(ライン有)-->
					{
						border-left			:1px solid #000000;
						border-right		:1px solid #000000;
						border-bottom		:1px solid #000000;
					}
					td.linelb							<!--セル定義(ライン有)-->
					{
						border-top		:1px solid #ffffff;
						border-left		:1px solid #000000;
						border-right		:1px solid #ffffff;
						border-bottom		:1px solid #000000;
						border-bottom-left-radius: 30px;
					}
					td.ellipse 
					{ 
						border :1px solid #000000;
						border-radius :30px;
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
					.midashiS_R							<!--見出し項目-->
					{
						font-family		:YuGothic, Yu Gothic;
						font-size		:7pt;
						text-align		:right;
					}
					.midashiM_C							<!--見出し項目-->
					{
						font-family		:YuGothic, Yu Gothic;
						font-size		:9pt;
						text-align		:center;
					}
					.midashiL_L							<!--見出し項目-->
					{
						font-family		:YuGothic, Yu Gothic;
						font-size		:10pt;
						text-align		:left;
					}
					.midashi2L_C						<!--見出し項目-->
					{
						font-family		:YuGothic, Yu Gothic;
						font-size		:10pt;
						text-align		:center;
						background-color:lightgray;
					}
					.oshirase							<!--明細データ（文字項目）-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:7pt;
						line-height		:11px;
						vertical-align	:top;
						text-align		:left;
					}
					.normalS_L							<!--明細データ（文字項目）-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:7pt;
						text-align		:left;
					}
					.normalS_R						<!--明細データ（文字項目）-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:7pt;
						text-align		:right;
					}
					.normalL_L								<!--明細データ（文字項目）-->
					{
						font-family		:YuGothic, Yu Gothic;
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
					.normal2L_C								<!--明細データ（文字項目）-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:10pt;
						text-align		:center;
					}
					.normalL_R								<!--明細データ（文字項目）-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:9pt;
						text-align		:right;
					}
					.normal2L_TL								<!--明細データ（文字項目）-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:10pt;
						vertical-align	:top;
						text-align		:left;
					}
					br.kaipage							<!--改行フォント-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:10px;
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
	
	<xsl:template match="N7240001">
		<xsl:if test="count(_被保険者)!=0">
		<!--　再帰ループ呼出　-->
			<xsl:call-template name="saikiloop">
				<xsl:with-param name="end_1" select="ceiling(count(_被保険者) div 5)" />
				<xsl:with-param name="count_1" select="1" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<!--　頁スタイル呼出　-->
	<xsl:template name="saikiloop">
		<xsl:param name="end_1" />
		<xsl:param name="count_1" />
		<xsl:if test="$count_1 &lt;= $end_1">
			
			<!--　改ページ挿入　-->
			<xsl:if test="2 &lt;= $count_1">
				<div style="page-break-after:always;" />
			</xsl:if>
			
			<table class="outline" cellpadding="20px" cellspacing="0">
				<tr>
					<td class="outline">
						<!--　被保険者単位のデータ表示　-->
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
	
	<xsl:template match="_被保険者" mode="header">
		<xsl:param name="pagecnt_1" />
		<xsl:if test="($pagecnt_1=position())">
			<table class="detail " cellpadding="0" cellspacing="0">
				<td style="vertical-align:top;">
				
					<table class="detail" cellpadding="0" cellspacing="0">
						<td style="vertical-align:top;">
							<table class="Lterritory" >
								<colgroup>
									<col width="30px" />
									<col width="200px" />
									<col width="90px" />
								</colgroup>
								<tr>
									<td style="height:70px;"></td>
								</tr>
								<tr>
									<td></td>
									<td class="normalL_TL" style="height:45px;line-height:20px;"><xsl:value-of select="事業所名称" /></td>
									<td></td>
								</tr>
							</table>
							
							<table class="Lterritory" >
								<colgroup>
									<col width="170px" />
									<col width="40px" />
									<col width="15px" />
									<col width="95px" />
								</colgroup>
								<tr>
									<td></td>
									<td class="normalL_L" style="height:20px"><xsl:value-of select="手作業通知書固定文言情報01" /></td>
									<td></td>
									<td class="normalL_L" style="height:20px"><xsl:value-of select="手作業通知書固定文言情報02" /></td>
								</tr>
							</table>
						</td>
						
						<td style="vertical-align:top;">
							<table class="Rterritory" cellpadding="0" cellspacing="0">
								<colgroup>
									<col width="290px" />
									<col width="30px" />
								</colgroup>
								<tr>
									<td style="height:25px;"></td>
								</tr>
								<tr>
									<td class="normalL_R" style="height:17px;"><xsl:value-of select="通知年月日" /></td>
									<td></td>
								</tr>
								<tr>
									<td class="normalL_R"><xsl:value-of select="初回発行年月日" /></td>
									<td></td>
								</tr>
							</table>
							
							<table class="Rterritory" cellpadding="0" cellspacing="0">
								<colgroup>
									<col width="152px" />
									<col width="100px" />
									<col width="3px" />
									<col width="35px" />
									<col width="30px" />
								</colgroup>
								<tr>
									<td></td>
									<td class="normalS_R" style="height:15px;"><xsl:value-of select="通知管理番号" /></td>
									<td></td>
									<td class="normalS_R" style="height:15px;"><xsl:value-of select="通知管理番号枝番" /></td>
									<td></td>
								</tr>
							</table>
							
							<table class="Rterritory" cellpadding="0" cellspacing="0">
								<colgroup>
									<col width="122px" />
									<col width="45px" />
									<col width="3px" />
									<col width="120px" />
									<col width="30px" />
								</colgroup>
								<tr>
									<td></td>
									<td class="midashiS_R" style="height:15px;">
										<xsl:if test="到達番号!=''">
											<xsl:value-of select="手作業通知書固定文言情報14" />
										</xsl:if>
									</td>
									<td></td>
									<td class="normalS_R" style="height:15px;"><xsl:value-of select="到達番号" /></td>
									<td></td>
								</tr>
								<tr>
									<td style="height:25px;"></td>
								</tr>
								<tr>
									<xsl:if test="初回発行年月日=''">
										<td style="height:12px;"></td>
									</xsl:if>
								</tr>
							</table>
							
							<table class="Rterritory" cellpadding="0" cellspacing="0">
								<colgroup>
									<col width="145px" />
									<col width="145px" />
									<col width="30px" />
								</colgroup>
								<tr>
									<td></td>
									<td class="normalL_L" style="height:25px;"><xsl:value-of select="手作業通知書固定文言情報03" /></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td class="normalL_TL" style="height:50px;line-height:16px;"><xsl:value-of select="日本年金機構代表者名称" /></td>
									<td></td>
								</tr>
								<tr>
									<td style="height:15px;"></td>
								</tr>
							</table>
						</td>
					</table>
					
					<table class="detail">
						<tr>
							<td class="title" style="height:25px">定時決定に係る年間報酬額算定の不該当一覧表</td>
						</tr>
						<tr>
							<td style="height:25px"></td>
						</tr>
					</table>
				</td>
			</table>
			
			<table class="detail" cellpadding="1" cellspacing="0">
				<td style="vertical-align:top;">
					<table class="detail" >
						<colgroup>
							<col width="60px" />
							<col width="525px" />
							<col width="55px" />
						</colgroup>
						<tr>
							<td></td>
							<td class="normal2L_TL" style="height:75px;line-height:18px;"><xsl:value-of select="届出年月日" /><xsl:value-of select="手作業通知書固定文言情報05" /></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td class="normal2L_TL" style="height:75px;line-height:18px;">
								<xsl:call-template name="loop">
									<xsl:with-param name="str" select="手作業通知書固定文言情報06" />
								</xsl:call-template>
							</td>
							<td></td>
						</tr>
						<tr>
							<td style="height:15px;"></td>
						</tr>
					</table>
				</td>
			</table>
			
			<table class="detail" cellpadding="1" cellspacing="0">
				<td style="vertical-align:top;">
					<table class="detail" >
						<colgroup>
							<col width="30px" />
							<col width="555px" />
							<col width="55px" />
						</colgroup>
						<tr>
							<td></td>
							<td class="midashiL_L" style="height:15px;"><xsl:value-of select="手作業通知書固定文言情報07" /></td>
							<td></td>
						</tr>
					</table>
					
					<table class="detail" >
						<colgroup>
							<col width="77px" />
							<col width="498px" />
							<col width="105px" />
						</colgroup>
						<tr>
							<td></td>
							<td class="normal2L_TL" style="height:115px;line-height:18px;">
								<xsl:call-template name="loop">
									<xsl:with-param name="str" select="理由"/>
								</xsl:call-template>
							</td>
							<td></td>
						</tr>
						<tr>
							<td style="height:10px;"></td>
						</tr>
					</table>
					
				</td>
			</table>
			
			<table class="detail" cellpadding="1" cellspacing="0">
				<td style="vertical-align:top;">
					<table class="detail" >
						<colgroup>
							<col width="30px" />
							<col width="555px" />
							<col width="55px" />
						</colgroup>
						<tr>
							<td></td>
							<td class="midashiL_L" style="height:17px;"><xsl:value-of select="手作業通知書固定文言情報08" /></td>
							<td></td>
						</tr>
					</table>
				</td>
			</table>
			
			<table class="detail" cellpadding="0" cellspacing="0">
				<td style="vertical-align:top;">
					<table class="detail" >
						<colgroup>
							<col width="50px" />
							<col width="145px" />
							<col width="395px" />
							<col width="50px" />
						</colgroup>
						<tr>
							<td></td>
							<td class="midashi2L_C allline" style="height:25px"><xsl:value-of select="手作業通知書固定文言情報09" /></td>
							<td class="midashi2L_C allline" style="height:25px"><xsl:value-of select="手作業通知書固定文言情報10" /></td>
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
				<col width="50px" />
				<col width="145px" />
				<col width="395px" />
				<col width="50px" />
			</colgroup>
			<tr>
				<td></td>
				<td class="normal2L_C linelrb" style="height:25px"><xsl:value-of select="被保険者番号" /></td>
				<td class="normal2L_C linelrb" style="height:25px"><xsl:value-of select="氏名" /></td>
				<td></td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="_被保険者" mode="footer">
		<xsl:param name="pagecnt_1" />
		<xsl:if test="($pagecnt_1=position())">			
			<table class="detail" cellpadding="1" cellspacing="0" style="border-collapse:separate;">
				<colgroup>
					<col width="325px"/>
					<col width="280px"/>
					<col width="35px"/>
				</colgroup>
				<tr>
					<td></td>
					<td class="ellipse">
						<table class="detail2" style="position:relative; top:-15px">
							<colgroup>
								<col width="20px" />
								<col width="60px" />
								<col width="200px" />
							</colgroup>
							<tr>
								<td></td>
								<td class="midashiM_C" style="height:20px;background:white;"><xsl:value-of select="手作業通知書固定文言情報11" /></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
						
						<table class="detail2" style="position:relative; top:-15px">
							<colgroup>
								<col width="70px" />
								<col width="13px" />
								<col width="182px" />
								<col width="15px" />
							</colgroup>
							<tr>
								<td class="normalS_L" style="height:15px">
									<xsl:if test="日本年金機構照会先名称1!=''">
										　<xsl:value-of select="手作業通知書固定文言情報12" />
									</xsl:if>
									<xsl:if test="日本年金機構照会先名称1=''">
									</xsl:if>
								</td>
								<td></td>
								<td class="normalS_L" style="height:15px"><xsl:value-of select="日本年金機構照会先名称1" /></td>
								<td></td>
							</tr>
						</table>
						
						<table class="detail2" style="position:relative; top:-15px">
							<colgroup>
								<col width="265px" />
								<col width="5px" />
								<col width="45px" />
							</colgroup>
							<tr>
								<xsl:if test="日本年金機構照会先名称2!=''">
									<td class="normalS_L" style="height:15px">　（又は　<xsl:value-of select="日本年金機構照会先名称2" />）</td>
								</xsl:if>
								<xsl:if test="日本年金機構照会先名称2=''">
									<td style="height:15px"></td>
								</xsl:if>
								
								<td></td>
							</tr>
							<tr>
								<td class="normalS_L" style="height:15px">　<xsl:value-of select="その他" /></td>
								<td class="normalS_L"></td>
								<td></td>
							</tr>
							
						</table>
						<table class="detail2" style="position:relative; top:-15px">
							<colgroup>
								<col width="80px" />
								<col width="10px" />
								<col width="95px" />
								<col width="95px" />
							</colgroup>
							<tr>
								<td class="normalS_L" style="height:20px;padding-bottom:5px;">
									<xsl:if test="連絡先電話番号!=''">
										　<xsl:value-of select="手作業通知書固定文言情報13" />
									</xsl:if>
									<xsl:if test="連絡先電話番号=''">
									</xsl:if>
								</td>
								<td class="normalS_L" style="height:20px;padding-bottom:5px;"></td>
								<td class="normalS_L" style="height:20px;padding-bottom:5px;"><xsl:value-of select="連絡先電話番号" /></td>
								<td class="normalS_L" style="height:20px;padding-bottom:5px;"></td>
							</tr>
						</table>
					</td>
					<td></td>
				</tr>
			</table>
		</xsl:if>
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
	
	<!--CDATA対応-->
	<xsl:template match="*">
		<xsl:value-of select="." disable-output-escaping="yes" />
	</xsl:template>

</xsl:stylesheet>
