package co.company.papang.vo;

import lombok.Builder;
import lombok.Data;
@Builder
@Data
public class Community_comVO {
	private String cc_no;
	private String mbr_id;
	private String cc_content;
	private String com_no;
	private String cc_date;
	private String cc_category;
}
