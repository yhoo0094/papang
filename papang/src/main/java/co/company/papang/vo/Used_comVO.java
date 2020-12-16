package co.company.papang.vo;

import lombok.Builder;
import lombok.Data;
@Builder
@Data
public class Used_comVO {
	private String used_no;
	private String uc_no;
	private String uc_date;
	private String uc_content;
	private String mbr_id;
}
