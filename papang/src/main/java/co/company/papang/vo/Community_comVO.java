package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Community_comVO {
	private String cc_no;
	private String mbr_id;
	private String cc_content;
	private String com_no;
	private String cc_date;
	private String cc_category;
}
