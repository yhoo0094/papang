package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PreventionVO {
	private String chi_no;
	private String prv_name;
	private String prv_date;
	private String prv_memo;
}
