<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <h1 class="mt-4">알림 관리</h1>
   <div align="center">
         <table class="table">
            <tbody>
               <tr>
                  <td align="center">분류</td>
                  <td><select name="nq_category">
                        <option value="공지사항">공지사항</option>
                        <option value="자주묻는 질문" selected>자주묻는 질문</option>      
                  </select></td>
               </tr>
               <tr>
                  <td align="center">제목</td>
                  <td><input type="text" style="width: 100%"></td>
               </tr>
               <tr>
      
              <td align="center">받는 사람</td>
                  <td><input type="text" style="width: 100%"></td>
               </tr>
               <tr>
               <td align="center"><br><br><br><br><br>내용</td><td colspan="2"><textarea rows="10" cols="210" style="width:100%"></textarea></td>
               </tr>
            </tbody>
         </table>