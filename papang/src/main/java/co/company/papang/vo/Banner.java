package co.company.papang.vo;

import lombok.Builder;
import lombok.Data;
@Builder
@Data
public class Banner {

	private String ban_no;
	private String ban_category;
	private String ban_pic_name;
	private String ban_pic_status;
	private String ban_pic;
	private String ban_link;
	private String ad_id;
}
