package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Sitter_comVO {
	private String sit_mbr_id;
	private String mbr_id;
	private String sc_no;
	private String sc_content;
	private String sc_rate;
}
