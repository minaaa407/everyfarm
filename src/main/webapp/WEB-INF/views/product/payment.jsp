<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 : EveryFarm</title>
</head>
<body>
<!--article-title-->
			<div class="article-title">
				<h2 class="title-page"><span>결제</span></h2>
				<div class="page-sorting">
					<a href="/app/cart"><span>장바구니</span></a>
					<span>&gt;</span>
					<span class="current-page">주문서</span>
					<span>&gt;</span>
					<span>주문 완료</span>
				</div>
			</div>
<!--//article-title-->

<div>
    <div>
        <div>
            <h3>Recipient Info <span>구매자</span></h3>
        </div>
    </div>


    <div>
        <div>
<!--수령자 정보-->
            <ul>
                <li>배송지 선택</li>
            </ul>
            <ul>
                <li>수령인</li>
                <li>
                    <div style="display: none;">
                        <input type="text" name="rcvr_nm" value="" maxlength="20" onkeyup="removeEmoji($(this));" />
                    </div>
                </li>
            </ul>
            <ul>
                <li>휴대전화</li>
                <li>
                    <div style="display: none;">
                        <select name="rmobile1">
                            <option value="">선택하세요</option>
                            <option value="010" >010</option>
                            <option value="011" >011</option>
                            <option value="016" >016</option>
                            <option value="017" >017</option>
                            <option value="018" >018</option>
                            <option value="019" >019</option>
                        </select>
                        <!--<input type="text" name="rmobile1" />-->
                        <input type="text" name="rmobile2" value="" maxlength="4" onkeyup="removeEmoji($(this));" />
                        <input type="text" name="rmobile3" value="" maxlength="4" onkeyup="removeEmoji($(this));" />
                    </div>
                </li>
            </ul>
            <ul>
                <li>전화번호</li>
                <li>
                    <div>
                        <span id="delivery-phone"></span>
                    </div>
                                        <div style="display: none;">
                        <select name="rphone1" >
                            <option value="">선택하세요</option>
                            <option value="02" >02</option>
                            <option value="031" >031</option>
                            <option value="032" >032</option>
                            <option value="033" >033</option>
                            <option value="041" >041</option>
                            <option value="042" >042</option>
                            <option value="043" >043</option>
                            <option value="044" >044</option>
                            <option value="051" >051</option>
                            <option value="052" >052</option>
                            <option value="053" >053</option>
                            <option value="054" >054</option>
                            <option value="055" >055</option>
                            <option value="061" >061</option>
                            <option value="062" >062</option>
                            <option value="063" >063</option>
                            <option value="064" >064</option>
                            <option value="010" >010</option>
                            <option value="011" >011</option>
                            <option value="016" >016</option>
                            <option value="017" >017</option>
                            <option value="018" >018</option>
                            <option value="019" >019</option>
                            <option value="070" >070</option>
                        </select>
                        <!--<input type="text"  name="rphone1" />-->
                        <input type="text" name="rphone2" value="" maxlength="4" onkeyup="removeEmoji($(this));" />
                        <input type="text" name="rphone3" value="" maxlength="4" onkeyup="removeEmoji($(this));" />
                        <p>
                            <label>
                                <input type="checkbox" onClick="SetRecipientPhoneNumber(this);" id="r_PhoneNumberCheckBox" name="rphonecheckbox" /> 없음
                            </label>
                        </p>
                    </div>
                </li>
            </ul>
            <ul>
                <li>배송지 주소</li>
                <li>
                    <div>
                        <span id="delivery-addr">()  </span>
                    </div>
                                        <div style="display: none;">
                        <input type="text" data-name="data-zipcode" name="rzip_cd1" onChange="Order.checkAddDlvFee();" size="7" value="" readonly />
                        <a class="plain-btn btn btn-zipcode" onClick="window.open('/app/util/find_kakao_zip_post','','width=504,height=688,resizable,scrollbars=yes,alwaysReised=yes');">주소 찾기</a><br />
                        <input type="text" data-name="data-addr1" name="rzip_addr1" value="" readonly/>
                        <input type="text" data-name="data-addr2" name="rzip_addr2" value="" placeholder="상세 주소를 입력해주세요" maxlength="90" onkeyup="removeEmoji($(this));" />
                    </div>
                </li>
            </ul>
            <ul>
                <li>배송 메모<br />
                </li>
                <li>
                    <select name="dlv_selectbox" id="dlv_selectbox" onchange="showEtc(this.value);">
                        <option value="">배송 시 요청사항을 선택해주세요</option>
                        <option value="부재 시 경비실에 맡겨주세요">부재 시 경비실에 맡겨주세요</option>
                        <option value="부재 시 택배함에 넣어주세요">부재 시 택배함에 넣어주세요</option>
                        <option value="부재 시 집 앞에 놔주세요">부재 시 집 앞에 놔주세요</option>
                        <option value="배송 전 연락 바랍니다">배송 전 연락 바랍니다</option>
                        <option value="파손의 위험이 있는 상품입니다. 배송 시 주의해주세요">파손의 위험이 있는 상품입니다. 배송 시 주의해주세요</option>
                        <option value="etc">직접 입력</option>
                    </select>
                    <textarea name="etc_textarea" id="etc_textarea"  style="display:none" value="" maxlength="50" onkeyup="return textarea_maxlength(this)" placeholder="최대 50자까지 입력 가능합니다."></textarea>
                </li>
            </ul>
                        <!--수령자 정보-->
         </div>
        <div>
            <ul>
                <li>
                    <input type="text" name="ordr_nm" value="" onblur="$('#virtual_bank_inpnm').val(this.value);" onkeyup="removeEmoji($(this));" maxlength="20"/>
                </li>
            </ul>
            <ul>
                <li>
                    <!--이메일-->
                    <input type="text" name="email1" value="" maxlength="30" onkeyup="removeEmoji($(this));" />@
                    <input type="text" name="email_etc" value="" style="display:none;" maxlength="20" onkeyup="removeEmoji($(this));" />
                    <select name="email2" onChange="inputDomain('email2','email_etc');">
                        <option value="etc" >직접 입력</option>
                        <option value="naver.com" >naver.com</option>
                        <option value="paran.com"  >paran.com</option>
                        <option value="hanmail.net"  >hanmail.net</option>
                        <option value="hotmail.com" >hotmail.com</option>
                        <option value="nate.com" >nate.com</option>
                    </select>
                    <script type="text/javascript">inputDomain('email2','email_etc', true);</script>
                </li>
            </ul>
            <ul>
                <li>
                    <!--휴대전화-->
                        <input type="text" name="omobile1" value="" size="3" maxlength="3" onkeyup="removeEmoji($(this));" /> -
                        <input type="text" name="omobile2" value="" size="3" maxlength="4" onkeyup="removeEmoji($(this));" /> -
                        <input type="text" name="omobile3" value="" size="3" maxlength="4" onkeyup="removeEmoji($(this));" />
                                    </li>
            </ul>
            <ul>
                <li>
                        <input type="text" name="ophone1" value="" size="3" maxlength="4" onkeyup="removeEmoji($(this));" /> -
                        <input type="text" name="ophone2" value="" size="3" maxlength="4" onkeyup="removeEmoji($(this));" /> -
                        <input type="text" name="ophone3" value="" size="3" maxlength="4" onkeyup="removeEmoji($(this));" />
                        <div class="box_check">
                            <label>
                                <input type="checkbox" onClick="SetBuyerPhoneNumber(this);" name="ophonecheckbox"/> 없음
                            </label>
                        </div>
                                    </li>
            </ul>
            <ul>
                <li style="display:none">
                    <!--주소-->
                    <input type="text" name="ozip_cd1"  value=""  size="7" readonly />
                    <a class="plain-btn btn" onClick="popup_new_zipcode('ozip_cd1','ozip_addr1','ozip_addr2', 504, 688); return false;">우편번호 찾기</a>
                    <input type="text" name="ozip_addr1" value="" />
                    <input type="text" name="ozip_addr2" value=""/>
                </li>
            </ul>
            <!--//구매자 정보-->
        </div>
    </div>
</div>

			<div>
				<h3>Product Info<span>상품 정보</span></h3>
				<input type="hidden" id="discount_applied_yn" value="" />
				<input type="hidden" id="event_min_pay_amt" value="10000" />
				<!--cart products-->
				<table>
					<colgroup>
						<col>
						<col width="50px">
<!--					<col width="100px">-->
						<col width="80px">
						<col width="80px">
						<col width="70px" class="charge ">
						<col width="69px" class="charge ">
						<col width="100px" class="charge ">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">상품 정보</th>
							<th scope="col">수량</th>
<!--						<th scope="col">상품 금액</th>-->
							<th scope="col">적립금</th>
							<th scope="col">상품 할인</th>
							<th scope="col">배송 그룹</th>
							<th scope="col">배송비</th>
							<th scope="col">주문금액</th>
						</tr>
					</thead>
				</table>
			</div>
</body>
</html>