$file = 'C:\Users\LJG\Desktop\BusanOn_v2\src\main\resources\mappers\BusinessMapper.xml'
$content = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

$pattern = '(?s)\t<!-- 펜션 리스트 불러오기\(검색된 값\) 리뷰 평점 추가-->.*?</select> '

$replacement = '	<!-- 펜션 리스트 불러오기(검색된 값) 리뷰 평점 추가-->
	<select id="getPensionList" resultType="com.BusanOn.domain.PensionDTO">
		SELECT *
		  FROM (
			SELECT P.PEN_ID
				 , P.PEN_NAME
			     , P.PEN_ADDRESS
			     , A.PEN_IMAGE
			     , IFNULL(ROUND(AVG(R.REV_STAR),0), ''0'') AS STAR
			     , COUNT(R.REV_NUM) AS RV
			     , IFNULL((SELECT MIN(CAST(RM_PRICE AS UNSIGNED))
					         FROM PENSION_ROOM
					        WHERE PEN_ID = P.PEN_ID), 0) AS RM_PRICE
			  FROM PENSION P LEFT OUTER JOIN PENSION_ATTACH A
									         ON P.PEN_ID = A.PEN_ID
				  		     LEFT OUTER JOIN REVIEW R
		                                     ON A.PEN_ID = R.PEN_ID
			 WHERE 1=1
			<if test="pen_name != null and !pen_name.equals('''')">
			   AND PEN_NAME LIKE ''%${pen_name}%''
			</if>
			<if test="pen_address != null and !pen_address.equals('''')">
			   AND PEN_ADDRESS LIKE ''%${pen_address}%''
			</if>
		 	GROUP BY P.PEN_ID, P.PEN_NAME, P.PEN_ADDRESS, A.PEN_IMAGE
		  ) A
		<if test="order != null and !order.equals('''')">
			<if test="order == ''rev'' or order.equals(''rev'')">ORDER BY CAST(RV AS UNSIGNED) DESC</if>
			<if test="order == ''hPr'' or order.equals(''hPr'')">ORDER BY CAST(RM_PRICE AS UNSIGNED) DESC</if>
			<if test="order == ''lPr'' or order.equals(''lPr'')">ORDER BY CAST(RM_PRICE AS UNSIGNED) ASC</if>
		</if>
		LIMIT ${index}, ${amount}
	</select>'

$newContent = [System.Text.RegularExpressions.Regex]::Replace($content, $pattern, $replacement, [System.Text.RegularExpressions.RegexOptions]::Singleline)

if ($newContent -ne $content) {
    [System.IO.File]::WriteAllText($file, $newContent, [System.Text.Encoding]::UTF8)
    Write-Host 'SUCCESS: getPensionList replaced'
} else {
    Write-Host 'FAILED: pattern not found'
    Write-Host 'Content starts with:' $content.Substring(0, 200)
}
