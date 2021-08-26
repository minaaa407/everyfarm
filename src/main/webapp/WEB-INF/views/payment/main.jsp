<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fieldset>
    <legend>Colors</legend>
    <input type="radio" id="rdPink" name="rdColors" value="#ffc0cb" checked><label for="rdPink">PINK</label>
    <input type="radio" id="rdRed" name="rdColors" value="#ff0000" disabled><label for="rdRed">RED</label>
    <input type="radio" id="rdOrange" name="rdColors" value="#ffa500"><label for="rdOrange">ORANGE</label>
    <input type="radio" id="rdYellow" name="rdColors" value="#ffff00"><label for="rdYellow">YELLOW</label>
    <input type="radio" id="rdGreen" name="rdColors" value="#008000"><label for="rdGreen">GREEN</label>
    <input type="radio" id="rdCyan" name="rdColors" value="#00ffff"><label for="rdCyan">CYAN</label>
</fieldset>
<script>
/* Checkbox change event */
$('input[name="rdColors"]').change(function() {
    // 모든 radio를 순회한다.
    $('input[name="rdColors"]').each(function() {
        var value = $(this).val();              // value
        var checked = $(this).prop('checked');  // jQuery 1.6 이상 (jQuery 1.6 미만에는 prop()가 없음, checked, selected, disabled는 꼭 prop()를 써야함)
        // var checked = $(this).attr('checked');   // jQuery 1.6 미만 (jQuery 1.6 이상에서는 checked, undefined로 return됨)
        // var checked = $(this).is('checked');
        var $label = $(this).next();
 
        if(checked)
            $label.css('background-color', value)
        else
            $label.css('background-color', 'white');
    });
});

/* Checked 찾기 */
var id = $('input[name="rdColors"]:checked').attr('id');
var value = $('input[name="rdColors"]:checked').val();
 
/* Unchecked 찾기 */
var str = "";
$('input[name="rdColors"]:not(:checked)').each(function() {
    var id = $(this).attr('id');
    var value = $(this).val();
    str += id + "/" + value + ", ";
});

/* PINK (Radio 1개) Checked 설정 */
$('#rdPink').prop('checked', true);
 
/* PINK (Radio 1개) Checked 해제 */
$('#rdPink').prop('checked', false);
 
/* PINK (Radio 1개) 상태 반전 */
$('#rdPink').prop('checked', !$('#rdPink').prop('checked'));

/* 전체 Checked 해제 */
$('input[name="rdColors"]').each(function() {
    $(this).prop('checked', false);
});

/* PINK (Checkbox 1개) Value */
var id = $('#rdPink').attr('id');
var value = $('#rdPink').val();
 
/* Checked Values */
var id = $('input[name="rdColors"]:checked').attr('id');
var value = $('input[name="rdColors"]:checked').val();
 
/* 전체 Unchecked Values */
var str = "";
$('input[name="rdColors"]:not(:checked)').each(function() {
    var id = $(this).attr('id');
    var value = $(this).val();
    str += id + "/" + value + ", ";
});

/* 전체 개수 */
/* name으로 찾기 */
var num = $('input[name="rdColors"]').length;
 
/* 전체 Checked 개수 */
var num = $('input[name="rdColors"]:checked').length;
 
/* 전체 Unchecked 개수 */
var num = $('input[name="rdColors"]:not(:checked)').length;


</script>
</body>
</html>