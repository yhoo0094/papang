<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <h3>입 고</h3>
     	
       <div align="center">
       <form id="form1" class="form-horizontal">
         <table class="table">
            <tbody>
               <tr>
                  <td align="center" id='pro_no_title'>상품 번호</td>
                  <td><select name ='pro_no'>
                  	<c:forEach items="${product}" var="pro">
                  	<option value='${pro.pro_no}'>${pro.pro_no} : ${pro.pro_name}</option>
                  	</c:forEach>
                  </select>
                  </td>
               </tr>
               <tr>
                  <td align="center">수량</td>
                  <td><input type="text" style="width: 100%" name ='ware_cnt'></td>
               </tr>
               <tr>
               <td align="center"><br><br><br><br><br>특이사항</td><td colspan="2"><textarea name = 'ware_note' rows="10" cols="210" style="width: 100%"></textarea></td>
               </tr>
            </tbody>
         </table>
         <div align="center">
			<input type="button" class="btn btn-primary" value="등록"
				id="btnInsert" />  <input type="button"
				class="btn btn-primary" value="초기화" id="btnInit" />
		</div>
      </div>
      </form>