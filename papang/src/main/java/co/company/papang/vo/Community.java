package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Community {
	private String com_no;
	private String mbr_id;
	private String com_category;
	private String com_title;
	private String com_content;
	private String com_date;
	private String com_hit;
}
