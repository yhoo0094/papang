package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Report_info {
	private String rinfo_no;
	private String mbr_id;
	private String rinfo_reason;
	private String rinfo_cnt;
	private String rinfo_start;
	private String repo_no;
}
