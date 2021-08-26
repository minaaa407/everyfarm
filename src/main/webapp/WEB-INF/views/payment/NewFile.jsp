<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Cart</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
    table th, td{ 
        text-align: center;
    }
</style>
<body>
    <div class="container">
        <h3>Buy Fruit</h3>    
        <table class="table table-bordered" id="tbl-product">
            <colgroup>
                <col style="width: 20%;" />
                <col style="width: 20%" />
                <col style="width: 20%" />
                <col style="width: 20%" />
                <col style="width: 20%" />
            </colgroup>
            <tr>             
                <th>checkbox</th>   
                <th>코드</th>   
                <th>품목</th>
                <th>가격</th>
                <th>수량</th>
            </tr>
            <tr>                
                <td><input type="checkbox" name="fruit"></td>
                <td>1</td>
                <td>사과</td>
                <td>500</td>
                <td><input type="number" class="edt-qty" value="0" min="0"></td>
            </tr>
            <tr>       
                <td><input type="checkbox" name="fruit"></td>         
                <td>2</td>
                <td>바나나</td>
                <td>1500</td>
                <td><input type="number" class="edt-qty" value="0" min="0"></td>
            </tr>
            <tr>         
                <td><input type="checkbox" name="fruit"></td>       
                <td>3</td>
                <td>딸기</td>
                <td>1000</td>
                <td><input type="number" class="edt-qty" value="0" min="0"></td>
            </tr>
        </table>
        <div style="text-align: right;margin-bottom: 20px;">
            <button type="button" class="btn btn-primary" id="btn-delete">삭제</button>
        </div>                
        <table class="table table-bordered" id="tbl-order" style="display: none;">            
            <thead>                
                <th>품목</th>
                <th>가격</th>
                <th>수량</th>
                <th>금액</th>
            </thead>
            <tbody></tbody>
        </table>        
        <table class="table table-bordered" id="tbl-total">
            <thead>
                <tr>
                    <th>총수량</th>
                    <th>총금액</th>
                </tr>
            </thead>
            <tbody>
                <td><input type="number" readonly="readonly" id="total-qty" value="0"></td>
                <td><input type="number" readonly="readonly" id="total-amt" value="0"></td>
            </tbody>            
        </table>
    </div>    
</body>
<script>
$(document).ready(function(){

    // check box 눌렀을 경우 정보 담아주는 변수
    var cart = {
        buyList : [],
        init : function() {
            //buyList 초기화
            this.buyList = [];
        },
        getBuyList : function(obj) {
            return this.buyList;
        },
        getFindIndex : function(cd) {
            //배열 중복 검색
            var fIdx = -1;
            this.buyList.forEach(function(item, idx, ary) {
                if(item.code == cd) {
                    fIdx = idx;
                }
            });
            return fIdx;
        },
        addBuyList : function(obj) {
            var fIdx = this.getFindIndex(obj.code);
            if(fIdx == -1) {
                this.buyList.push(obj);
            } else {
                this.buyList[fIdx] = obj;
            }
            this.render();
        },
        deleteBuyList : function(cd) {
            this.buyList.splice(this.getFindIndex(cd), 1);
            this.render();
        },
        getTotalPay : function() {
            //총 결제금액 계산
            var totalQty = 0;
            var totalPrice = 0;
            
            this.buyList.forEach(function(item, idx, ary) {
                totalQty += Number(item.qty);
                totalPrice += Number(item.price)*Number(item.qty);
            });
            return {
                totalQty : totalQty,
                totalPrice : totalPrice
            };
        },
        render : function() {            
            // 주문 table 그리기
            var order = $('#tbl-order tbody');
            if(this.buyList.length > 0) {
                var html = [];
                this.buyList.forEach(function(item, idx, ary) {
                    html.push([
                        '<tr data-cd="', item.cd ,'">',                        
                        '<td>', item.title, '</td>',
                        '<td>', item.price, '</td>',
                        '<td>', item.qty, '</td>',
                        '<td>', Number(item.price)*Number(item.qty), '</td>',
                        '</tr>'
                    ].join(''));
                });
                order.html(html);

                // 총 결제금액&수량 table 그리기
                var total = this.getTotalPay();
                $('#total-qty').val(total.totalQty);
                $('#total-amt').val(total.totalPrice);
                $('#tbl-order').show();                

            } else {
                // 주문내역 table 숨기기
                $('#tbl-order').hide();                
     
                // 주문내역 지우기
                order.empty();
     
                // 총 결제정보 지우기
                $('#total-qty').val(0);
                $('#total-amt').val(0);
            }            
        }
    };

    // 수량 클릭 시
    $('.edt-qty').on('change', function() {
        var tr = $(this).closest('tr');
        var code = tr.children('td:eq(1)').text();
        var title = tr.children('td:eq(2)').text();
        var price = Number(tr.children('td:eq(3)').text());
        var qty = Number(tr.children('td:eq(4)').find('input').val());

        // 수량이 0 초과하는 경우 buyList에 추가 
        // 수량이 0 이하인 경우 buyList에서 삭제
        if(qty > 0) {
            var obj = {
                code : code,
                title : title,
                price : price,
                qty : qty
            }
            cart.addBuyList(obj);
        } else {
            cart.deleteBuyList(code);
        }
        console.log(cart.getBuyList());
    });

    // 삭제 버튼 클릭 시
    $('#btn-delete').on('click', function() {

        var chkList = $('input[name="fruit"]:checked');        
        var cd;

        // chcekd 된 product row 삭제
        // order row 삭제
        for(var i = chkList.length-1; i > -1; i--) {
            cd = chkList.eq(i).closest('tr').find('td:eq(1)').text();            
            chkList.eq(i).closest('tr').remove();
            cart.deleteBuyList(cd);
        }     
    });

}); //end document ready

$.fn.serializeObject = function() {
    "use strict";
    
    var result = {};
    var extend = function(i, element) {
        var node = result[element.name];

        if ('undefined' !== typeof node && node !== null) {
            if ($.isArray(node)) {
                node.push(element.value);
            } else {
                result[element.name] = [ node, element.value ];
            }
        } else {
            result[element.name] = element.value;
        }
    };

    $.each(this.serializeArray(), extend);
    return result;
};
</script>
</html>