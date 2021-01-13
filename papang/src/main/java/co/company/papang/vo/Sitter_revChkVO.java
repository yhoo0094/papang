package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Sitter_revChkVO {
	private String srv_no;
	private String sit_mbr_id;
	private String mbr_id;
	private String chi_no;
	private String srv_date;
	private String srv_pay;
	private String srv_status;
	private String start_date;
	private String end_date;
	private String count;
	private String review;
	private String sc_content;
	private String sc_rate;
	
}
