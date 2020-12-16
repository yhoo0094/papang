package co.company.papang.vo;

import lombok.Builder;
import lombok.Data;
@Builder
@Data
public class Community {
	private String com_no;
	private String mbr_id;
	private String com_category;
	private String com_title;
	private String com_content;
	private String com_date;
	private String com_hit;
}
