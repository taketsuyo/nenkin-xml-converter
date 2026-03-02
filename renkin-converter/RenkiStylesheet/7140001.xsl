<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<head>
				<META http-equiv="X-UA-Compatible" content="IE=11" />
				<title>健康保険・厚生年金保険被保険者標準報酬改定一覧表</title>
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
					table.hihokensha					<!--被保険者データテーブル-->
					{
						border-collapse		:collapse;
						width				:640px;
						height				:380px;
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
						border-right	:1px solid #000000;
						border-bottom	:1px solid #000000;
					}
					td.linetlb							<!--セル定義(ライン有)-->
					{
						border-top		:1px solid #000000;
						border-left		:1px solid #000000;
						border-bottom	:1px solid #000000;
					}
					td.linetrb							<!--セル定義(ライン有)-->
					{
						border-top		:1px solid #000000;
						border-right	:1px solid #000000;
						border-bottom	:1px solid #000000;
					}
					td.linetb							<!--セル定義(ライン有)-->
					{
						border-top		:1px solid #000000;
						border-bottom	:1px solid #000000;
					}
					td.linelrb							<!--セル定義(ライン有)-->
					{
						border-left		:1px solid #000000;
						border-right	:1px solid #000000;
						border-bottom	:1px solid #000000;
					}
					td.linelb							<!--セル定義(ライン有)-->
					{
						border-left		:1px solid #000000;
						border-bottom	:1px solid #000000;
					}
					td.linerb							<!--セル定義(ライン有)-->
					{
						border-right		:1px solid #000000;
						border-bottom	:1px solid #000000;
					}
					td.lineb							<!--セル定義(ライン有)-->
					{
						border-bottom	:1px solid #000000;
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
					.midashiS_C							<!--見出し項目-->
					{
						font-family		:YuGothic, Yu Gothic;
						font-size		:7pt;
						text-align		:center;
					}
					.midashiS_L							<!--見出し項目-->
					{
						font-family		:YuGothic, Yu Gothic;
						font-size		:7pt;
						text-align		:left;
					}
					.hmidashiS_C							<!--表見出し項目-->
					{
						font-family		:YuGothic, Yu Gothic;
						font-size		:7.1pt;
						text-align		:center;
					}
					.hmidashiS_L							<!--表見出し項目-->
					{
						font-family		:YuGothic, Yu Gothic;
						font-size		:7.1pt;
						text-align		:left;
					}
					.midashiM_L							<!--明細データ（文字項目）-->
					{
						font-family		:YuGothic, Yu Gothic;
						font-size		:8pt;
						text-align		:left;
					}
					.normalS_L							<!--明細データ（文字項目）-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:7pt;
						text-align		:left;
					}
					.normalS_TL							<!--明細データ（文字項目）-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:7pt;
						vertical-align	:top;
						text-align		:left;
					}
					.normalS_R							<!--明細データ（文字項目）-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:7pt;
						text-align		:right;
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
					.normalL_R								<!--明細データ（文字項目）-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:9pt;
						text-align		:right;
					}
					.oshirase							<!--明細データ（文字項目）-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:7pt;
						line-height		:11px;
						vertical-align	:top;
						text-align		:left;
					}
					.kyouji								<!--明細データ（文字項目）-->
					{
						font-family		:YuMincho, Yu Mincho;
						font-size		:8.8pt;
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
						word-wrap		:break-word;
						font-family		:YuMincho, Yu Mincho;
						font-size		:7pt;
					}
				</style>
			</head>
			<body style="word-break:break-all;">
				<table border="0" width="100%" style="text-align:center">
					<tr>
						<td align="center" style="vertical-align:top;">
							<xsl:apply-templates/>
						</td>
					</tr>
				</table>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="N7140001">
		<xsl:if test="count(_被保険者)!=0">
		<!--　再帰ループ呼出　-->
			<xsl:call-template name="saikiloop">
				<xsl:with-param name="end_1" select="ceiling(count(_被保険者) div 15)" />
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
				<div style="page-break-after:always;height:0px;" />
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
									<td style="height:30px;"></td>
								</tr>
								<tr>
									<td></td>
									<td class="normalS_L" style="height:25px"><xsl:value-of select="事業所郵便番号_送付先" /></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td class="normalM_L" style="height:15px;"><xsl:value-of select="事業所所在地_送付先" /></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td class="normalM_L" style="height:15px;"><xsl:value-of select="事業所所在地_送付先1" /></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td class="normalL_TL" style="height:34px;line-height:15px;"><xsl:value-of select="事業所名称_送付先" /></td>
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
									<col width="237px" />
									<col width="40px" />
									<col width="7px" />
									<col width="1px" />
									<col width="45px" />
								</colgroup>
								<tr>
									<td class="normalS_L" style="height:25px"></td>
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
									<col width="132px" />
									<col width="50px" />
									<col width="3px" />
									<col width="120px" />
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
									<col width="5px" />
									<col width="30px" />
									<col width="230px" />
									
								</colgroup>
								<tr>
									<td></td>
									<td class="midashiS_L" style="height:20px"><xsl:value-of select="SC_固定文字" /></td>
									<td></td>
									<td class="normalS_L" style="height:20px"><xsl:value-of select="SC" /></td>
									<td></td>
								</tr>
								<tr>
									<td style="height:5px"></td>
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
									<td class="oshirase allline" style="height:185px;line-height:11px;"><pre class="oshirase"><xsl:value-of select="機構からのお知らせ" /></pre></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td style="height:10px;"></td>
									<td></td>
								</tr>
							</table>
							
						</td>
					</table>
					
					<table class="detail">
						<tr>
							<td class="title" style="height:33px">健康保険・厚生年金保険被保険者標準報酬改定一覧表</td>
						</tr>
					</table>
					
					<table class="detail" cellpadding="1" cellspacing="0">
						<colgroup>
							<col width="35px" />
							<col width="70px" />
							<col width="15px" />
							<col width="50px" />
							<col width="470px" />
						</colgroup>
						<tr>
							<td></td>
							<td class="midashiS_L" style="height:15px">事業所整理記号</td>
							<td></td>
							<td class="normalS_L" style="height:15px"><xsl:value-of select="事業所整理記号" /></td>
							<td></td>
						</tr>
					</table>
					
					<table class="detail" cellpadding="1" cellspacing="0">
						<colgroup>
							<col width="35px" />
							<col width="70px" />
							<col width="14px" />
							<col width="40px" />
							<col width="480px" />
						</colgroup>
						<tr>
							<td></td>
							<td class="midashiS_L" style="height:20px">事業所番号</td>
							<td></td>
							<td class="normalS_R" style="height:20px"><xsl:value-of select="事業所番号" /></td>
							<td></td>
						</tr>
					</table>
					
				</td>
			</table>
			
			<table class="detail" cellpadding="0" cellspacing="0">
				<td style="vertical-align:top;">
					
					<table class="detail" cellpadding="0" cellspacing="0">
						<colgroup>
							<col width="30px"/>
							<col width="47px"/>
							<col width="170px"/>
							<col width="18px"/>
							<col width="22px"/>
							<col width="25px"/>
							<col width="73px"/>
							<col width="73px"/>
							<col width="15px"/>
							<col width="20px"/>
							<col width="20px"/>
							<col width="25px"/>
							<col width="62px"/>
							<col width="30px"/>
						</colgroup>
						<tr>
							<td></td>
							<td class="hmidashiS_C allline" style="height:40px" rowspan="2">被保険者<br/>整理番号</td>
							<td class="hmidashiS_C allline" rowspan="2">被保険者氏名</td>
							<td class="hmidashiS_L allline" style="padding-left:3px;" rowspan="2" colspan="3">※1<br/>　改定年月</td>
							<td class="hmidashiS_C allline" colspan="2">決定後の標準報酬月額</td>
							<td class="hmidashiS_L allline" style="padding-left:3px;" rowspan="2" colspan="4">※1<br/>　 生年月日</td>
							<td class="hmidashiS_L allline" style="padding-left:3px;" rowspan="2">※2<br/>　　種別</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td class="hmidashiS_C allline">（健保）</td>
							<td class="hmidashiS_C allline">（厚年）</td>
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
				<col width="30px"/>
				<col width="47px"/>
				<col width="170px"/>
				<col width="18px"/>
				<col width="22px"/>
				<col width="25px"/>
				<col width="73px"/>
				<col width="73px"/>
				<col width="15px"/>
				<col width="20px"/>
				<col width="20px"/>
				<col width="25px"/>
				<col width="62px"/>
				<col width="30px"/>
			</colgroup>
			<tr>
				<td></td>
				<td class="normalL_R linelrb" style="padding-right:5px;">
					<xsl:call-template name="zero-padding">
						<xsl:with-param name="str" select="被保険者整理番号"/>
					</xsl:call-template>
				</td>
				<td class="normalL_L linelrb" style="padding-left:8px;"><xsl:value-of select="被保険者氏名" /></td>
				<td class="normalL_L lineb" style="padding-left:13px;"><xsl:value-of select="改定年月_元号" /></td>
				<td class="normalL_R lineb" style="height:25px;">
					<xsl:call-template name="zero-padding2">
						<xsl:with-param name="str" select="改定年月_年"/>
					</xsl:call-template>
				</td>
				<td class="normalL_R linerb" style="padding-right:10px;">
					<xsl:call-template name="zero-padding">
						<xsl:with-param name="str" select="改定年月_月"/>
					</xsl:call-template>
				</td>
				<td class="normalL_R linelrb" style="padding-right:6px;"><xsl:value-of select="決定後の標準報酬月額_健保" /></td>
				<td class="normalL_R linelrb" style="padding-right:6px;"><xsl:value-of select="決定後の標準報酬月額_厚年" /></td>
				<td class="normalL_L linelb" style="padding-left:10px;"><xsl:value-of select="生年月日_元号" /></td>
				
				<td class="normalL_R lineb">
					<xsl:call-template name="zero-padding2">
						<xsl:with-param name="str" select="生年月日_年"/>
					</xsl:call-template>
				</td>
				<td class="normalL_R lineb">
					<xsl:call-template name="zero-padding2">
						<xsl:with-param name="str" select="生年月日_月"/>
					</xsl:call-template>
				</td>
				<td class="normalL_R linerb" style="padding-right:7px;">
					<xsl:call-template name="zero-padding">
						<xsl:with-param name="str" select="生年月日_日"/>
					</xsl:call-template>
				</td>
				<td class="normalM_L linelrb" style="padding-left:5px;"><xsl:value-of select="種別" /></td>
				<td></td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="_被保険者" mode="footer">
		<xsl:param name="pagecnt_1" />
		<xsl:if test="($pagecnt_1=position())">
			
			<table class="detail" cellpadding="1" cellspacing="0">
				<td style="vertical-align:top;">
				
					<table class="detail" cellpadding="4" cellspacing="0">
						<colgroup>
							<col width="35px"/>
							<col width="555px"/>
							<col width="50px"/>
						</colgroup>
						<tr>
							<td></td>
							<td class="normalS_L" style="height:15px">※1　元号　　S：昭和　H：平成　R：令和</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td class="normalS_L" style="line-height:12px;">※2　種別　　第一種：男性　第二種：女性　第三種：坑内員　特例第一種：男性（基金加入）　特例第二種：女性（基金加入）<br/>　　　　　　 特例第三種：坑内員（基金加入）</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td class="normalS_L" style="padding-left:11px;"></td>
							<td></td>
						</tr>
					</table>
					
					<table class="detail" >
						<colgroup>
							<col width="365px" />
							<col width="275px" />
						</colgroup>
						<tr>
							<td></td>
							<td class="normalM_L" style="height:15px">
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
							<col width="353px" />
							<col width="287px" />
						</colgroup>
						<tr>
							<td></td>
							<td class="normalM_L" style="height:15px"><xsl:value-of select="初回発行年月日" /></td>
						</tr>
					</table>
					
					<table class="detail" >
						<colgroup>
							<col width="370px" />
							<col width="270px" />
						</colgroup>
						<tr>
							<td></td>
							<td class="normalM_L" style="height:25px"></td>
						</tr>
					</table>
					
					<table class="detail" >
						<colgroup>
							<col width="370px" />
							<col width="270px" />
						</colgroup>
						<tr>
							<td></td>
							<td class="normalM_L" style="height:15px">（<xsl:value-of select="年金事務所名" />年金事務所）</td>
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
			<xsl:when test="$str!=''"><xsl:value-of select="number($str)"/>.</xsl:when>
			<xsl:when test="$str=''">0.</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="*">
		<xsl:value-of select="." disable-output-escaping="yes" />
	</xsl:template>

</xsl:stylesheet>
