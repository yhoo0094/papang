package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Act_comVO {
	private String mbr_id;
	private String ac_no;
	private String ac_content;
	private String ac_rate;
	private String ac_category;
	private String pc_no;
	private String ac_pic;
	private String ROUNDRATE;
}
