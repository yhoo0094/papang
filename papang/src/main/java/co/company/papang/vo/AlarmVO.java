package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AlarmVO {
	private String arm_no;
	private String mbr_id;
	private String arm_content;
	private String arm_date;
	private String arm_status;
}
