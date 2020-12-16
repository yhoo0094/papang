package co.company.papang.vo;

import lombok.Builder;
import lombok.Data;
@Builder
@Data
public class Sitter_revVO {
	private String sit_mbr_id;
	private String mbr_id;
	private String sc_no;
	private String sc_content;
	private String sc_rate;
}
