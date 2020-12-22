package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UsedVO {
	private String used_no;
	private String mbr_id;
	private String used_title;
	private String used_date;
	private String used_category;
	private String used_loc;
	private String used_pic;
	private String used_hit;
	private String used_price;
	private String used_content;
}
