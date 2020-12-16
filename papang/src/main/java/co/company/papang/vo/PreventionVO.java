package co.company.papang.vo;

import lombok.Builder;
import lombok.Data;
@Builder
@Data
public class PreventionVO {
	private String chi_no;
	private String prv_name;
	private String prv_date;
	private String prv_memo;
}
