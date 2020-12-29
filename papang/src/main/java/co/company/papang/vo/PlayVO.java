package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlayVO {
	private String play_no;
	private String play_title;
	private String mbr_id;
	private String play_hit;
	private String play_category;
	private String play_content;
}
