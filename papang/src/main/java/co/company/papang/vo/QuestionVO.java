package co.company.papang.vo;

import lombok.Builder;
import lombok.Data;
@Builder
@Data
public class QuestionVO {
	private String q_no;
	private String mbr_id;
	private String q_title;
	private String q_content;
	private String q_category;
}
