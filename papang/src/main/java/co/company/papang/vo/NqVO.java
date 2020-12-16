package co.company.papang.vo;

import lombok.Builder;
import lombok.Data;
@Builder
@Data
public class NqVO {
	private String nq_no;
	private String nq_title;
	private String nq_content;
	private String nq_category;
	private String nq_file;
	private String nq_date;
	private String ad_id;
}
