package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Used_comVO {
	private String used_no;
	private String uc_no;
	private String uc_date;
	private String uc_content;
	private String mbr_id;
}
