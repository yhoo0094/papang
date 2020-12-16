package co.company.papang.vo;

import lombok.Builder;
import lombok.Data;
@Builder
@Data
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
