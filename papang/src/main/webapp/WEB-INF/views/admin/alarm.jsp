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
               <td align="center"><br><br><br>첨부파일</td>
               <td>
               <table style="width:100%">
               <tr><td align="center"><br><br><br>마우스로 파일을 끌어놓으세요.<br><br><br><br></td></tr>
               <tr><td align="center"><button>내 PC</button><button>WE드라이브</button></td></tr>
               </table>
               </td>
               </tr>
               <tr>
               <td align="center"><br><br><br><br><br>내용</td><td colspan="2"><textarea rows="10" cols="210"></textarea></td>
               </tr>
            </tbody>
         </table>