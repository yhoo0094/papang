<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<script type="text/javascript">
	function inv(form, bv) {
		form.outv.value += bv;
	}
	function ind(bd) {
		bd.outv.value = "";
	}
	function ino(io) {
		io.outv.value = eval(io.outv.value);
	}
</script>

	<form name="cal">
		<table border="0" align="center">
			<tr>
				<td colspan="4" class="nuv"><input type="text" name="outv"
					readonly></td>
			</tr>
			<tr>
				<td class="nu1"><input type="button" style="width: 35px;"
					value="1" onclick="inv(this.form, '1')"></td>
				<td class="nu2"><input type="button" style="width: 35px;"
					value="2" onclick="inv(this.form, '2')"></td>
				<td class="nu3"><input type="button" style="width: 35px;"
					value="3" onclick="inv(this.form, '3')"></td>
				<td class="nu+"><input type="button" style="width: 35px;"
					value="+" onclick="inv(this.form, '+')"></td>
			</tr>
			<tr>
				<td class="nu4"><input type="button" style="width: 35px;"
					value="4" onclick="inv(this.form, '4')"></td>
				<td class="nu5"><input type="button" style="width: 35px;"
					value="5" onclick="inv(this.form, '5')"></td>
				<td class="nu6"><input type="button" style="width: 35px;"
					value="6" onclick="inv(this.form, '6')"></td>
				<td class="nu-"><input type="button" style="width: 35px;"
					value="-" onclick="inv(this.form, '-')"></td>
			</tr>
			<tr>
				<td class="nu7"><input type="button" style="width: 35px;"
					value="7" onclick="inv(this.form, '7')"></td>
				<td class="nu8"><input type="button" style="width: 35px;"
					value="8" onclick="inv(this.form, '8')"></td>
				<td class="nu9"><input type="button" style="width: 35px;"
					value="9" onclick="inv(this.form, '9')"></td>
				<td class="nu*"><input type="button" style="width: 35px;"
					value="*" onclick="inv(this.form, '*')"></td>
			</tr>
			<tr>
				<td class="nu0"><input type="button" style="width: 35px;"
					value="0" onclick="inv(this.form, '0')"></td>
				<td class="nuC"><input type="button" style="width: 35px;"
					value="C" onclick="ind(this.form)"></td>
				<td class="nu%"><input type="button" style="width: 35px;"
					value="%" onclick="inv(this.form, '%')"></td>
				<td class="nu/"><input type="button" style="width: 35px;"
					value="/" onclick="inv(this.form, '/')"></td>
			</tr>
			<tr>
				<td class="nu=" colspan="4"><input type="button"
					style="width: 160px;" value="=" onclick="ino(this.form)"></td>
			</tr>
		</table>
	</form>



