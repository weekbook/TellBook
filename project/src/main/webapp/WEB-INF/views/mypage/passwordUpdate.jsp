<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="frm" method="post" action="/account/popup/wpopup_passchange.aspx" id="frm">
        <input type="hidden" name="Email" id="Email" value="weekbook@naver.com">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tbody><tr>
                <td background="https://image.aladin.co.kr/img/common/popup_bg.jpg" style="padding: 0 0 0 20px; color: #FFFFFF; font-weight: bold; font-size: 14px;">비밀번호 변경하기</td>
            </tr>
            <tr>
                <td colspan="2" height="3" background="https://image.aladin.co.kr/img/common/popup_bg2.jpg"></td>
            </tr>
        </tbody></table>
        <table width="100%" height="300" cellpadding="0" cellspacing="0">
            <tbody><tr>
                <td align="left" valign="top" style="padding-top: 6px; padding-left: 15px; padding-right: 15px">
                    
                    <img src="/ucl_editor/img_secur/account/2005/icon_pi.gif" width="3" height="3" vspace="8" align="absmiddle">
                    현재 사용하고 계신 비밀번호를 먼저 입력하신 후, 아래에 변경할 새 비밀번호를 입력하세요<br>
                    
                    <img src="/ucl_editor/img_secur/account/2005/icon_pi.gif" width="3" height="3" vspace="8" align="absmiddle">
                    비밀번호는 영문 대문자, 소문자, 숫자, 특수문자를 3가지 이상 사용하여<br>
                    &nbsp;&nbsp;8자 이상, 20자 이하로 설정하십시오.<br>
                    <br>
                    <table width="100%" cellspacing="1" cellpadding="4" border="0">
                        <tbody><tr>
                            <td height="1" bgcolor="d0dee8" colspan="2"></td>
                        </tr>

                        
                        <tr>
                            <td width="130" height="40" align="right" bgcolor="f3f7fa" style="padding-right: 10px">
                                기존 비밀번호</td>
                            <td style="padding-left: 10px"><input class="af1" type="password" name="password" id="password" maxlength="20"></td>
                        </tr>
                        
                        <tr>
                            <td width="90" height="40" align="right" bgcolor="f3f7fa" style="padding-right: 10px">
                                새 비밀번호</td>
                            <td style="padding-left: 10px">
                                <input class="af1" type="password" size="20" name="newpassword" id="newpassword" maxlength="20"><br>
                                <div id="Jlayer" style="display: none; position: absolute;">
                                    <div style="padding: 0px; height: 19px;">
                                        새 비빌번호 확인
                                    </div>
                                    <div class="bottom">
                                        <p class="point" id="pwdStrengthGrade">비밀번호를 입력해주세요.</p>
                                        <p style="margin-left: 5px;" id="pwdMsgDetail"></p>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="90" height="40" align="right" bgcolor="f3f7fa" style="padding-right: 10px">
                                새 비밀번호 확인</td>
                            <td style="padding-left: 10px">
                                <input class="af1" type="password" size="20" name="chknewpassword" id="chknewpassword" maxlength="20"></td>
                        </tr>
                        <tr>
                            <td height="1" bgcolor="d0dee8" colspan="2"></td>
                        </tr>
                    </tbody></table>
                    <br>
                    <div style="text-align: center">
                        <a href="#" onclick="javascript:submitChangePassword();">
                            비밀번호 변경하기
                        </a>
                    </div>
                    <br>
                    <br>
                </td>
            </tr>
            <tr>
                <td height="25" align="right" bgcolor="e6e6e6" style="padding-right: 10px"><a href="#" onclick="javascript:window.close();">
                    창 닫기</a>
                </td>
            </tr>
        </tbody></table>
        <input type="hidden" name="changeType">
        <input type="hidden" name="or" id="or" value="0">
        <input type="hidden" name="ACT" value="Yes">
    </form>
</body>
</html>