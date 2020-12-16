package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LullabyVO {
	private String lul_no;
	private String lul_title;
	private String lul_link;
	private String lul_content;
	private String lul_pic;
	private String lul_hit;
}
