package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BannerVO {

	private String ban_no;
	private String ban_category;
	private String ban_pic_name;
	private String ban_pic_status;
	private String ban_pic;
	private String ban_link;
	private String ad_id;
}
