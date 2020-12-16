package co.company.papang.vo;

import lombok.Builder;
import lombok.Data;
@Builder
@Data
public class CookVO {
	private String srv_no;
	private String sit_mbr_id;
	private String mbr_id;
	private String chi_no;
	private String srv_time;
	private String srv_date;
	private String srv_pay;
	private String srv_status;
}
