package co.company.papang.vo;

import lombok.Builder;
import lombok.Data;
@Builder
@Data
public class Act_comVO {
	private String play_no;
	private String play_title;
	private String play_content;
	private String play_pic;
	private String mbr_id;
	private String play_hit;
	private String play_category;
}
