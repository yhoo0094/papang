package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReportVO {
	private String repo_no;
	private String mbr_id;
	private String repo_category;
	private String repo_category_no;
	private String repo_title;
	private String repo_content;
	private String repo_status;
	private String repo_ans;
}
